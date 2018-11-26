//
//  P63ScheduleCell.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63ScheduleCell.h"

@implementation P63ScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSchedule:(P63Schedule *)schedule {
    _placeImageView.image = schedule.placeImage;
    _title.text = [NSString stringWithFormat:@"%@ - %@", schedule.startPlace, schedule.destinationPlace];
    _members.text = [NSString stringWithFormat:@"%lu thành viên", schedule.partners.count + 1];
    _timeAndDistance.text = [NSString stringWithFormat:@"%@ - %ld Km", schedule.totalTime, (long)schedule.distance];
    _totalCost.text = [NSString stringWithFormat:@"%ld K VNĐ", (long)schedule.totalCost];
    if (schedule.isFinish) {
        _status.text = @"Đã kết thúc";
        _status.textColor = [UIColor colorWithRed:195.0f/255.0f green:74.0f/255.0f blue:68.0f/255.0f alpha:1.0f];
    } else {
        _status.text = @"Đang tham gia";
        _status.textColor = [UIColor colorWithRed:66.0f/255.0f green:176.0f/255.0f blue:109.0f/255.0f alpha:1.0f];
    }
    
    _schedule = schedule;
}

@end
