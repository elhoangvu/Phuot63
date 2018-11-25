//
//  P63TabBarController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/21/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63TabBarController.h"

@interface P63TabBarController () <UITabBarDelegate, UITabBarControllerDelegate>

@property (nonatomic) CGFloat addButtonWidth;
@property (nonatomic) UIImageView* scheduleView;
@property (nonatomic) UIImageView* reviewView;
@property (nonatomic) UIView* backgroundView;

@end

@implementation P63TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    CGRect sceen = UIScreen.mainScreen.bounds;
    _addButtonWidth = sceen.size.width*0.12;
    _backgroundView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];

    _scheduleView = [[UIImageView alloc] initWithFrame:(CGRectMake(sceen.size.width*0.4f,
                                                                   sceen.size.height*0.875f,
                                                                   0,
                                                                   0))];
    UIImage* scheduleImage = [UIImage imageNamed:@"flag-add"];
    _scheduleView.contentMode = UIViewContentModeScaleAspectFill;
    _scheduleView.image = scheduleImage;
    [_backgroundView addSubview:_scheduleView];
    
    _reviewView = [[UIImageView alloc] initWithFrame:(CGRectMake(sceen.size.width*0.6f,
                                                                 sceen.size.height*0.875f,
                                                                 0,
                                                                 0))];
    UIImage* reviewImage = [UIImage imageNamed:@"schedule-add"];
    _reviewView.contentMode = UIViewContentModeScaleAspectFill;
    _reviewView.image = reviewImage;
    [_backgroundView addSubview:_reviewView];
    [self.view addSubview:_backgroundView];
    [_backgroundView setHidden:YES];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(didTapScheduleView:)];
    [_scheduleView addGestureRecognizer:tapGesture];
    [_scheduleView setUserInteractionEnabled:YES];
    
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(didTapReviewView:)];
    [_reviewView addGestureRecognizer:tapGesture];
    [_reviewView setUserInteractionEnabled:YES];
    
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(didTapBackgroundView:)];
    [_backgroundView addGestureRecognizer:tapGesture];
}

- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
    [_backgroundView setHidden:YES];
}

- (void)didTapScheduleView:(UITapGestureRecognizer *)sender {
    [_backgroundView setHidden:YES];
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddScheduleVC"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didTapReviewView:(UITapGestureRecognizer *)sender {
    [_backgroundView setHidden:YES];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 2) {
        NSLog(@">>>> HV: didSelectItem");
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view bringSubviewToFront:_backgroundView];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController.tabBarItem.tag == 2) {
        if (_backgroundView.isHidden == YES) {
            
            [_backgroundView setHidden:NO];
            CGRect sceen = UIScreen.mainScreen.bounds;
            [_scheduleView setFrame:CGRectMake(sceen.size.width*0.4f,
                                               sceen.size.height*0.875f,
                                               0,
                                               0)];
            [_reviewView setFrame:CGRectMake(sceen.size.width*0.6f,
                                             sceen.size.height*0.875f,
                                             0,
                                             0)];
            
            __weak __typeof(self)weakSelf = self;
            [UIView animateWithDuration:0.3f animations:^{
                [weakSelf.scheduleView setFrame:CGRectMake(sceen.size.width*0.4f - weakSelf.addButtonWidth*0.5f,
                                                           sceen.size.height*0.875f - weakSelf.addButtonWidth*0.5f,
                                                           weakSelf.addButtonWidth,
                                                           weakSelf.addButtonWidth)];
                [weakSelf.reviewView setFrame:CGRectMake(sceen.size.width*0.6f - weakSelf.addButtonWidth*0.5f,
                                                         sceen.size.height*0.875f - weakSelf.addButtonWidth*0.5f,
                                                         weakSelf.addButtonWidth,
                                                         weakSelf.addButtonWidth)];
            }];
        }
        return NO;
    }
    return YES;
}

@end
