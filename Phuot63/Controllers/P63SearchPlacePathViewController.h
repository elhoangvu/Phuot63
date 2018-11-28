//
//  P63SearchPlacePathViewController.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/28/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "P63CreateScheduleViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface P63SearchPlacePathViewController : UIViewController

@property (nonatomic) CGFloat topOffset;
@property (nonatomic) BOOL isSelectStartPlace;
@property (nonatomic) P63CreateScheduleViewController* parentVC;
@property (nonatomic) NSString* startPlaceString;
@property (nonatomic) NSString* destinationPlaceString;

@end

NS_ASSUME_NONNULL_END
