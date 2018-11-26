//
//  P63Place.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface P63Place : NSObject

@property (nonatomic) NSString* placeName;
@property (nonatomic) NSString* fullPlaceDescription;
@property (nonatomic) Float32 starCount;
@property (nonatomic) NSInteger reviewerCount;
@property (nonatomic) NSInteger checkinCount;
@property (nonatomic) NSInteger review;
@property (nonatomic) NSString* lastUpdate;
@property (nonatomic) UIImage* placeImage;

- (instancetype)initWithPlaceName:(NSString *)placeName
             fullPlaceDescription:(NSString *)fullPlaceDescription
                        starCount:(Float32)starCount
                    reviewerCount:(NSInteger)reviewerCount
                     checkinCount:(NSInteger)checkinCount
                           review:(NSInteger)review
                       lastUpdate:(NSString *)lastUpdate;

@end

NS_ASSUME_NONNULL_END
