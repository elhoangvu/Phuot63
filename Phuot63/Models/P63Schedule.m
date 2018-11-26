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
                   distance:(NSInteger)distance
               expectedCost:(NSInteger)expectedCost
                   partners:(NSArray *)partners {
    if (!(self = [self initWithUID:uid
                        startPlace:startPlace
                  destinationPlace:destinationPlace
                         startTime:startTime
                           endTime:endTime
                      expectedCost:expectedCost
                          partners:partners
                         totalCost:0
                          distance:distance
                          isFinish:NO])) {
        return nil;
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *)uid
                 startPlace:(NSString *)startPlace
           destinationPlace:(NSString *)destinationPlace
                  startTime:(NSDate *)startTime
                    endTime:(NSDate *)endTime
               expectedCost:(NSInteger)expectedCost
                   partners:(NSArray * __nullable)partners
                  totalCost:(NSInteger)totalCost
                   distance:(NSInteger)distance
                   isFinish:(BOOL)isFinish {
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
    _totalCost          = totalCost;
    _distance           = distance;
    _isFinish           = isFinish;
    
    NSDateComponentsFormatter* dateCompFmter = [[NSDateComponentsFormatter alloc] init];
    dateCompFmter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
    dateCompFmter.allowedUnits = NSCalendarUnitDay;
    dateCompFmter.maximumUnitCount = 2;
    NSString* string = [dateCompFmter stringFromDate:_startTime toDate:_endTime];
    NSInteger date = 0;
    NSRange range;
    range.location = 0;
    range.length = 2;
    if ([[string substringWithRange:range] isEqualToString:@"1 "]) {
        date = 1;
    } else {
        string = [string stringByReplacingOccurrencesOfString:@" days" withString:@""];
        date = [string integerValue];
    }
    _totalTime = [NSString stringWithFormat:@"%ld ngày %ld đêm", (long)date, (long)date];
    _placeImage = [UIImage imageNamed:_destinationPlace];
    if (!_placeImage) {
        _placeImage = [UIImage imageNamed:@"phuot63"];
    }
    return self;
}

- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _isFinish = NO;
    
    return self;
}

@end
