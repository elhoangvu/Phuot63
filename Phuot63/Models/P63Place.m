//
//  P63Place.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63Place.h"

@implementation P63Place

- (instancetype)initWithPlaceName:(NSString *)placeName
             fullPlaceDescription:(NSString *)fullPlaceDescription
                        starCount:(Float32)starCount
                    reviewerCount:(NSInteger)reviewerCount
                     checkinCount:(NSInteger)checkinCount
                           review:(NSInteger)review
                       lastUpdate:(NSString *)lastUpdate {
    if (!(self = [super init])) {
        return nil;
    }
    
    _placeName = placeName;
    _fullPlaceDescription = fullPlaceDescription;
    _starCount = starCount;
    _reviewerCount = reviewerCount;
    _checkinCount = checkinCount;
    _review = review;
    _lastUpdate = lastUpdate;
    
    _placeImage = [UIImage imageNamed:_placeName];
    if (!_placeImage) {
        _placeImage = [UIImage imageNamed:@"phuot63"];
    }
    
    return self;
}

@end
