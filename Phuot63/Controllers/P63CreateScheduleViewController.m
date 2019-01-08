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
#import "P63SearchPlacePathViewController.h"

@interface P63CreateScheduleViewController ()
< UITableViewDelegate
, UITableViewDataSource >

@property (weak, nonatomic) IBOutlet UITableView *addScheduleTableView;
@property (weak, nonatomic) IBOutlet UIButton *createScheduleButton;
@property (nonatomic) P63CreateScheduleCell* addScheduleCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notiViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notiViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mapTopConstraint;
@property (nonatomic) BOOL isShowKeyboard;
@property (nonatomic) CGFloat pushViewOffset;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;

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
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _isShowKeyboard = NO;
}

- (void)dealloc
{
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
//    NSValue* keyboardSize = (NSValue *)[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGRect size = keyboardSize.CGRectValue;
    
    if (!_isShowKeyboard) {
//        NSLog(@">>>> HV: %f", _addScheduleCell.partners.frame.origin.y);
        CGFloat kz = 180.0f;
        if (UIScreen.mainScreen.bounds.size.height > 700) {
            kz = 300.0f;
        }
//        _pushViewOffset = UIScreen.mainScreen.bounds.size.height - kz - _addScheduleCell.partners.frame.origin.y + _addScheduleCell.partners.frame.size.height - _mapImageView.frame.size.height;
        if (_pushViewOffset > 0) {
            __weak __typeof(self)weakSelf = self;
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.mapTopConstraint.constant -= weakSelf.pushViewOffset;
                [weakSelf.view layoutIfNeeded];
            }];
            
            _isShowKeyboard = YES;
        } else {
            _pushViewOffset = 0;
        }
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    if (_isShowKeyboard) {
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.mapTopConstraint.constant += weakSelf.pushViewOffset;
            [weakSelf.view layoutIfNeeded];
        }];
        _isShowKeyboard = NO;
    }

}

- (IBAction)didTapAddPartnerTextField:(id)sender {

}

- (IBAction)didTapSearchTextField:(UITextField *)sender {
    P63SearchPlacePathViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchPlacePathVC"];
    vc.parentVC = self;
    vc.topOffset = _addScheduleCell.startPlace.frame.origin.y + _addScheduleTableView.frame.origin.y;
    vc.startPlaceString = _addScheduleCell.startPlace.text;
    vc.destinationPlaceString = _addScheduleCell.destinationPlace.text;
    if (sender.tag == 0) {
        vc.isSelectStartPlace = YES;
    } else {
        vc.isSelectStartPlace = NO;
    }
    [self presentViewController:vc animated:NO completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _addScheduleCell = [tableView dequeueReusableCellWithIdentifier:@"AddScheduleCell"];
    _addScheduleCell.rootVC = self;
    return _addScheduleCell;
}

- (IBAction)didTapCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCreateScheduleButton:(id)sender {
    BOOL shouldReturn = NO;
    if ([_addScheduleCell.startPlace.text isEqualToString:@""]) {
        _addScheduleCell.startPlace.layer.borderWidth = 0.75f;
        _addScheduleCell.startPlace.layer.borderColor = [UIColor colorWithRed:195.0f/255.0f green:74.0f/255.0f blue:68.0f/255.0f alpha:1.0f].CGColor;
        shouldReturn = YES;
    }
    
    if ([_addScheduleCell.destinationPlace.text isEqualToString:@""]) {
        _addScheduleCell.destinationPlace.layer.borderWidth = 0.75f;
        _addScheduleCell.destinationPlace.layer.borderColor = [UIColor colorWithRed:195.0f/255.0f green:74.0f/255.0f blue:68.0f/255.0f alpha:1.0f].CGColor;
        shouldReturn = YES;
    }
    
    if (shouldReturn) {
        return;
    }
    
    NSString* uid = [P63UserInfo sharedInstance].userID;
//    NSString* partnersString = _addScheduleCell.partners.text;
//    partnersString = [partnersString stringByReplacingOccurrencesOfString:@" " withString:@""];
//
//    NSArray* partners = [partnersString componentsSeparatedByString:@"@"];
//    NSRange range;
//    range.location = 1;
//    range.length = partners.count - 1;
//    partners = [partners subarrayWithRange:range];
    NSArray* partners = _addScheduleCell.partners;
    
    NSString* start = [NSString string];
    NSString* des = [NSString string];
    NSArray* startPlaces = [_addScheduleCell.startPlace.text componentsSeparatedByString:@","];
    NSArray* desPlaces = [_addScheduleCell.destinationPlace.text componentsSeparatedByString:@","];
    start = [startPlaces objectAtIndex:0];
    des = [desPlaces objectAtIndex:0];
    P63Schedule* schedule = [[P63Schedule alloc] initWithUID:uid
                                                  startPlace:start
                                            destinationPlace:des
                                                   startTime:[_addScheduleCell startDate]
                                                     endTime:[_addScheduleCell endDate]
                                                    distance:120
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
                [tbvc setSelectedViewController:[tbvc.viewControllers objectAtIndex:3]];
            }];
        }];
    };

    notiVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:notiVC animated:NO completion:nil];
}

- (void)didEndEditingWithStartPlace:(NSString *)startPlace
                   destinationPlace:(NSString *)destination {
    _addScheduleCell.startPlace.text = startPlace;
    _addScheduleCell.destinationPlace.text = destination;
}

@end
