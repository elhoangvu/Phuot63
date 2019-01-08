//
//  P63AddScheduleCell.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63CreateScheduleCell.h"
#import "P63UserInfo.h"
#import "P63SampleDataPool.h"
#import "P63AddPartnerViewController.h"
#import "P63PartnerCell2.h"

@interface P63CreateScheduleCell () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UIDatePicker* startTimeDatePicker;
@property (nonatomic) UIDatePicker* endTimeDatePicker;

@end

@implementation P63CreateScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configuration];
}

- (void)configuration {
    _startTimeDatePicker = [[UIDatePicker alloc] init];
    _startTimeDatePicker.datePickerMode = UIDatePickerModeDate;
    
    _endTimeDatePicker = [[UIDatePicker alloc] init];
    _endTimeDatePicker.datePickerMode = UIDatePickerModeDate;
    
    [_startTimeDatePicker addTarget:self action:@selector(startTimeDateChange:) forControlEvents:(UIControlEventValueChanged)];
    [_endTimeDatePicker addTarget:self action:@selector(endTimeDateChange:) forControlEvents:(UIControlEventValueChanged)];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCellView:)];
    [self addGestureRecognizer:tapGesture];
    
    _startTime.inputView = _startTimeDatePicker;
    _endTime.inputView = _endTimeDatePicker;
    
    _partnerTableView.delegate = self;
    _partnerTableView.dataSource = self;
    _partnerTableView.separatorColor = [UIColor clearColor];
//    _partners = P63SampleDataPool.sharedInstance.users;
    
    [self setCornerRadiusTextField:_startPlace];
    [self setCornerRadiusTextField:_destinationPlace];
    [self setCornerRadiusTextField:_startTime];
    [self setCornerRadiusTextField:_endTime];
    [self setCornerRadiusTextField:_expectedCost];
//    [self setCornerRadiusTextField:_partners];
}

- (void)setCornerRadiusTextField:(UITextField *)textField {
    textField.layer.cornerRadius = textField.frame.size.height*0.5f;
    textField.layer.borderWidth = 0.25;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.clipsToBounds = YES;
}

- (void)startTimeDateChange:(UIDatePicker *)datePicker {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"dd/MM/yyyy";
    _startTime.text = [df stringFromDate:datePicker.date];
// [self endEditing:true];
}

- (void)endTimeDateChange:(UIDatePicker *)datePicker {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"dd/MM/yyyy";
    _endTime.text = [df stringFromDate:datePicker.date];
    // [self endEditing:true];
}

- (void)didTapCellView:(UITapGestureRecognizer *)tapGesture {
    [self endEditing:true];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSDate *)startDate {
    return _startTimeDatePicker.date;
}

- (NSDate *)endDate {
    return _endTimeDatePicker.date;
}

- (IBAction)didChangeStartPlaceText:(UITextField *)sender {
    if (sender.text.length == 0) {
        sender.layer.borderWidth = 0.75;
        sender.layer.borderColor = [UIColor colorWithRed:195.0f/255.0f green:74.0f/255.0f blue:68.0f/255.0f alpha:1.0f].CGColor;
    } else {
        sender.layer.borderWidth = 0.25;
        sender.layer.borderColor = [UIColor grayColor].CGColor;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _partners.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    P63PartnerCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"PartnerCell"];
    P63UserInfo* user = (P63UserInfo *)[_partners objectAtIndex:indexPath.row];
    cell.name.text = user.displayname;
    cell.avatar.image = user.avatar;
    cell.avatar.layer.cornerRadius = 15.0f;
    
    cell.avatar.clipsToBounds = YES;
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = view;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)didEndSelectPartner:(NSArray *)partners {
    _partners = partners;
    [_partnerTableView reloadData];
}

- (IBAction)didTapEditButton:(id)sender {
    P63AddPartnerViewController* vc = [_rootVC.storyboard instantiateViewControllerWithIdentifier:@"AddPartnerVC"];
    vc.root = self;
    [_rootVC.navigationController pushViewController:vc animated:YES];
}



@end
