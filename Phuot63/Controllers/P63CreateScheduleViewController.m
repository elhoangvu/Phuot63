//
//  AddScheduleViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63CreateScheduleViewController.h"
#import "P63CreateScheduleCell.h"
#import "P63Schedule.h"
#import "P63UserInfo.h"
#import "P63SampleDataPool.h"
#import "P63CreateScheduleNotificationViewController.h"
#import "P63CreateScheduleNavigationViewController.h"

@interface P63CreateScheduleViewController ()
< UITableViewDelegate
, UITableViewDataSource >

@property (weak, nonatomic) IBOutlet UITableView *addScheduleTableView;
@property (weak, nonatomic) IBOutlet UIButton *createScheduleButton;
@property (nonatomic) P63CreateScheduleCell* addScheduleCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notiViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notiViewWidthConstraint;

@end

@implementation P63CreateScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName: [UIFont systemFontOfSize:20 weight:UIFontWeightHeavy] };
    _addScheduleTableView.delegate = self;
    _addScheduleTableView.dataSource = self;
    _addScheduleTableView.separatorColor = [UIColor clearColor];
    
    _createScheduleButton.backgroundColor = [UIColor colorWithRed:29.0f/255.0f
                                                            green:161.0f/255.0f
                                                             blue:242.0f/255.0f
                                                            alpha:1.0f];
    _createScheduleButton.tintColor = [UIColor whiteColor];
    _createScheduleButton.layer.cornerRadius = _createScheduleButton.frame.size.height*0.5f;
    _createScheduleButton.clipsToBounds = YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 310;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _addScheduleCell = [tableView dequeueReusableCellWithIdentifier:@"AddScheduleCell"];
    return _addScheduleCell;
}

- (IBAction)didTapCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCreateScheduleButton:(id)sender {
    if ([_addScheduleCell.startPlace.text isEqualToString:@""]) {
        
    } else if ([_addScheduleCell.destinationPlace.text isEqualToString:@""]) {
        
    } else {
        NSString* uid = [P63UserInfo sharedInstance].uid;
        NSString* partnersString = _addScheduleCell.partners.text;
        partnersString = [partnersString stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSArray* partners = [partnersString componentsSeparatedByString:@"@"];
        P63Schedule* schedule = [[P63Schedule alloc] initWithUID:uid
                                                      startPlace:_addScheduleCell.startPlace.text
                                                destinationPlace:_addScheduleCell.destinationPlace.text
                                                       startTime:[_addScheduleCell startDate]
                                                         endTime:[_addScheduleCell endDate]
                                                    expectedCost:[_addScheduleCell.expectedCost.text integerValue]
                                                        partners:partners];
        [[P63SampleDataPool sharedInstance].schedules addObject:schedule];
        
        P63CreateScheduleNotificationViewController* notiVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CreationNotificationVC"];
        __weak __typeof(self)weakSelf = self;
        notiVC.closeView = ^{
            [weakSelf dismissViewControllerAnimated:NO completion:^{
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }];
        };
        
        notiVC.gotoManageSchedule = ^{
            [weakSelf dismissViewControllerAnimated:NO completion:^{
                [weakSelf dismissViewControllerAnimated:YES completion:^{
                    P63CreateScheduleNavigationViewController* navigationVC = (P63CreateScheduleNavigationViewController *)weakSelf.navigationController;
                    UITabBarController* tbvc = (UITabBarController *)navigationVC.presentedParentViewController;
//                                        UIViewController* scheduleViewController = [weakSelf.storyboard instantiateViewControllerWithIdentifier:@"ScheduleVC"];
                    [tbvc setSelectedViewController:[tbvc.viewControllers objectAtIndex:3]];
                }];
            }];
        };

        notiVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:notiVC animated:NO completion:nil];
    }
}


@end
