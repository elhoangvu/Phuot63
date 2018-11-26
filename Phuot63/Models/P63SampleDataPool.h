//
//  SampleDataPool.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "P63Newsfeed.h"
#import "P63Schedule.h"

NS_ASSUME_NONNULL_BEGIN

@interface P63SampleDataPool : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic) NSMutableArray* newsfeeds;
@property (nonatomic) NSMutableArray* schedules;

@end

NS_ASSUME_NONNULL_END