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
    [self initSchedules];
    
    return self;
}

- (void)initNewsfeeds {
    _newsfeeds = [NSMutableArray arrayWithCapacity:23];
    NSMutableArray* photos    = [NSMutableArray array];
    
    [photos addObject:[UIImage imageNamed:@"sg-vt"]];
    P63Newsfeed* newsfeed = [[P63Newsfeed alloc] initWithName:@"Lê Hoàng Vũ"
                                                          uid:@"lehoangvu"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
    
    
    // ---------------------------------------------->
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
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
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
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
    [_newsfeeds addObject:newsfeed];
}

- (void)initSchedules {
    _schedules = [NSMutableArray arrayWithCapacity:3];
    
    NSString* dateFormat = @"ddMMyyyy";
    NSDate* startDate = [self dateWithString:@"01022018" dateFortmat:dateFormat];
    NSDate* endDate = [self dateWithString:@"04022018" dateFortmat:dateFormat];
    P63Schedule* schedule = [[P63Schedule alloc] initWithUID:@"lehoangvu"
                                                  startPlace:@"Sài Gòn"
                                            destinationPlace:@"Cà Mau"
                                                   startTime:startDate
                                                     endTime:endDate
                                                expectedCost:800
                                                    partners:nil];
    
    startDate = [self dateWithString:@"01102018" dateFortmat:dateFormat];
    endDate = [self dateWithString:@"06102018" dateFortmat:dateFormat];
    schedule = [[P63Schedule alloc] initWithUID:@"lehoangvu"
                                     startPlace:@"Sài Gòn"
                               destinationPlace:@"Đà Lạt"
                                      startTime:startDate
                                        endTime:endDate
                                   expectedCost:800
                                       partners:nil];
}

- (NSDate *)dateWithString:(NSString *)dateString dateFortmat:(NSString *)dateFormat {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    NSDate* date = [df dateFromString:dateString];
    return date;
}

@end
