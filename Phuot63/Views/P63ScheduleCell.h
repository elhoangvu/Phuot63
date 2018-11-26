//
//  P63ScheduleCell.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "P63Schedule.h"

NS_ASSUME_NONNULL_BEGIN

@interface P63ScheduleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *members;
@property (weak, nonatomic) IBOutlet UILabel *timeAndDistance;
@property (weak, nonatomic) IBOutlet UILabel *totalCost;
@property (weak, nonatomic) IBOutlet UILabel *status;

@property (weak, nonatomic) P63Schedule* schedule;

@end

NS_ASSUME_NONNULL_END
