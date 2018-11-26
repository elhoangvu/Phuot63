//
//  CreateScheduleNotificationView.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface P63CreateScheduleNotificationViewController : UIViewController

@property (nonatomic) void (^closeView)(void);
@property (nonatomic) void (^gotoManageSchedule)(void);

@end

NS_ASSUME_NONNULL_END
