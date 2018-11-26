//
//  P63Schedule.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface P63Schedule : NSObject

@property (nonatomic) NSString* uid;
@property (nonatomic) NSString* startPlace;
@property (nonatomic) NSString* destinationPlace;
@property (nonatomic) NSDate* startTime;
@property (nonatomic) NSDate* endTime;
@property (nonatomic) NSInteger expectedCost;
@property (nonatomic) NSArray* partners;
@property (nonatomic) NSInteger totalCost;
@property (nonatomic) NSInteger distance;
@property (nonatomic) NSString* totalTime;
@property (nonatomic) UIImage* placeImage;
@property (nonatomic) BOOL isFinish;

- (instancetype)initWithUID:(NSString *)uid
                 startPlace:(NSString *)startPlace
           destinationPlace:(NSString *)destinationPlace
                  startTime:(NSDate *)startTime
                    endTime:(NSDate *)endTime
                   distance:(NSInteger)distance
               expectedCost:(NSInteger)expectedCost
                   partners:(NSArray * __nullable)partners;

- (instancetype)initWithUID:(NSString *)uid
                 startPlace:(NSString *)startPlace
           destinationPlace:(NSString *)destinationPlace
                  startTime:(NSDate *)startTime
                    endTime:(NSDate *)endTime
               expectedCost:(NSInteger)expectedCost
                   partners:(NSArray * __nullable)partners
                  totalCost:(NSInteger)totalCost
                   distance:(NSInteger)distance
                   isFinish:(BOOL)isFinish;

@end

NS_ASSUME_NONNULL_END
