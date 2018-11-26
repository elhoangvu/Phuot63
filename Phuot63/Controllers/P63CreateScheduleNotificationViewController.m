//
//  CreateScheduleNotificationView.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63CreateScheduleNotificationViewController.h"

@interface P63CreateScheduleNotificationViewController ()

@property (weak, nonatomic) IBOutlet UIView *notiView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation P63CreateScheduleNotificationViewController

- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _notiView.layer.cornerRadius = 20.0f;
    _notiView.clipsToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _heightConstraint.constant = 0;
    _widthConstraint.constant = 0;
    [self.view.layer setOpaque:NO];
    [self.view setOpaque:NO];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.view layoutIfNeeded];
    
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.heightConstraint.constant = 210.0f;
        weakSelf.widthConstraint.constant = 190.0f;
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)didTapCloseButton:(id)sender {
    _closeView ? _closeView() : nil;
}

- (IBAction)didTapGoToManageScheduleButton:(id)sender {
    _gotoManageSchedule ? _gotoManageSchedule() : nil;
}


@end
