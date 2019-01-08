//
//  P63AddScheduleCell.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface P63CreateScheduleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *startPlace;
@property (weak, nonatomic) IBOutlet UITextField *destinationPlace;
@property (weak, nonatomic) IBOutlet UITextField *startTime;
@property (weak, nonatomic) IBOutlet UITextField *endTime;
@property (weak, nonatomic) IBOutlet UITextField *expectedCost;
//@property (weak, nonatomic) IBOutlet UITextField *partners;
@property (weak, nonatomic) IBOutlet UITableView *partnerTableView;
@property (nonatomic) NSArray* partners;
@property (weak, nonatomic) UIViewController* rootVC;

- (void)didEndSelectPartner:(NSArray *)partners;
- (NSDate *)startDate;
- (NSDate *)endDate;


@end

NS_ASSUME_NONNULL_END
