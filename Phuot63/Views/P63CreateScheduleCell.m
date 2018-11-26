//
//  P63AddScheduleCell.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63CreateScheduleCell.h"

@interface P63CreateScheduleCell ()

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

@end
