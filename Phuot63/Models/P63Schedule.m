//
//  P63Schedule.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63Schedule.h"

@implementation P63Schedule

- (instancetype)initWithUID:(NSString *)uid
                 startPlace:(NSString *)startPlace
           destinationPlace:(NSString *)destinationPlace
                  startTime:(NSDate *)startTime
                    endTime:(NSDate *)endTime
               expectedCost:(NSInteger)expectedCost
                   partners:(NSArray *)partners {
    if (!(self = [super init])) {
        return nil;
    }
    
    _uid                = uid;
    _startPlace         = startPlace;
    _destinationPlace   = destinationPlace;
    _startTime          = startTime;
    _endTime            = endTime;
    _expectedCost       = expectedCost;
    _partners           = partners;
    
    return self;
}

@end
