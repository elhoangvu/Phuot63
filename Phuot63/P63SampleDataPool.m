//
//  SampleDataPool.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63SampleDataPool.h"
@import UIKit;

@implementation P63SampleDataPool

+ (instancetype)sharedInstance {
    static P63SampleDataPool* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[P63SampleDataPool alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    [self initNewsfeeds];
    
    return self;
}

- (void)initNewsfeeds {
    NSMutableArray* newsfeeds = [NSMutableArray arrayWithCapacity:3];
    NSMutableArray* photos    = [NSMutableArray array];
    
    [photos addObject:[UIImage imageNamed:@"sg-vt"]];
    P63Newsfeed* newsfeed = [[P63Newsfeed alloc] initWithName:@"Lê Hoàng Vũ"
                                                          uid:@"11111111"
                                                   postedTime:[NSDate date]
                                                       avatar:[UIImage imageNamed:@"11111111"]
                                                       photos:photos
                                                        title:@"Sài Gòn - Vũng Tàu"
                                                         cost:500
                                                     duration:@"2 ngày 3 đêm"
                                                      content:@"Du lịch Vũng Tàu 😍😍😍"
                                                 isBookmarked:NO
                                                      isLiked:NO
                                                        likes:10
                                                     commnets:20
                                                    bookmarks:3];
    [newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"11111112"
                                      postedTime:[NSDate date]
                                          avatar:[UIImage imageNamed:@"11111112"]
                                          photos:photos
                                           title:@"Sài Gòn - Đà Lạt"
                                            cost:500
                                        duration:@"3 ngày 3 đêm"
                                         content:@"Du lịch Đà Lạt 😍😍😍"
                                    isBookmarked:NO
                                         isLiked:NO
                                           likes:10
                                        commnets:20
                                       bookmarks:3];
    [newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"11111113"
                                      postedTime:[NSDate date]
                                          avatar:[UIImage imageNamed:@"11111113"]
                                          photos:photos
                                           title:@"Bến Tre - Coco Beach"
                                            cost:500
                                        duration:@"2 ngày 2 đêm"
                                         content:@"Du lịch Coco Beach 😍😍😍"
                                    isBookmarked:NO
                                         isLiked:NO
                                           likes:10
                                        commnets:20
                                       bookmarks:3];
    [newsfeeds addObject:newsfeed];
    
    _newsfeeds = newsfeeds;
}

@end
