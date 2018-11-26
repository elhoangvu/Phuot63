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
    [self initPlaces];
    _currentLocation = @"Lagi";
    
    return self;
}

- (void)initNewsfeeds {
    _newsfeeds = [NSMutableArray arrayWithCapacity:23];
    NSMutableArray* photos    = [NSMutableArray array];
    
    [photos addObject:[UIImage imageNamed:@"sg-vt"]];
    P63Newsfeed* newsfeed = [[P63Newsfeed alloc] initWithName:@"Lê Hoàng Vũ"
                                                          uid:@"lehoangvu"
                                                   postedTime:[NSDate date]
                                                       avatar:[UIImage imageNamed:@"lehoangvu"]
                                                       photos:photos
                                                        title:@"Sài Gòn - Vũng Tàu"
                                                         cost:500
                                                     duration:@"2 ngày 3 đêm"
                                                      content:@"Du lịch Vũng Tàu 😍😍😍"
                                                 isBookmarked:NO
                                                      isLiked:YES
                                                        likes:10
                                                     commnets:20
                                                    bookmarks:3];
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"sg-dl"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Cao Việt"
                                             uid:@"trancaoviet"
                                      postedTime:[NSDate date]
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
                                          photos:photos
                                           title:@"Sài Gòn - Đà Lạt"
                                            cost:500
                                        duration:@"3 ngày 3 đêm"
                                         content:@"Du lịch Đà Lạt 😍😍😍"
                                    isBookmarked:YES
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
                                          photos:photos
                                           title:@"Bến Tre - Coco Beach"
                                            cost:500
                                        duration:@"2 ngày 2 đêm"
                                         content:@"Du lịch Coco Beach 😍😍😍"
                                    isBookmarked:YES
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
                                          photos:photos
                                           title:@"Sài Gòn - Đà Lạt"
                                            cost:500
                                        duration:@"3 ngày 3 đêm"
                                         content:@"Du lịch Đà Lạt 😍😍😍"
                                    isBookmarked:NO
                                         isLiked:YES
                                           likes:10
                                        commnets:20
                                       bookmarks:3];
    [_newsfeeds addObject:newsfeed];
    
    photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"bt-ccb"]];
    newsfeed = [[P63Newsfeed alloc] initWithName:@"Trần Thị Thanh Tuyền"
                                             uid:@"ttthanhtuyen"
                                      postedTime:[NSDate date]
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                          avatar:[UIImage imageNamed:@"trancaoviet"]
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
                                          avatar:[UIImage imageNamed:@"ttthanhtuyen"]
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
                                                    distance:500
                                                expectedCost:200
                                                    partners:nil];
    schedule.totalCost = 800;
    schedule.totalTime = @"3 ngày 3 đêm";
    schedule.isFinish = YES;
    [_schedules addObject:schedule];
    
    startDate = [self dateWithString:@"01102018" dateFortmat:dateFormat];
    endDate = [self dateWithString:@"06102018" dateFortmat:dateFormat];
    schedule = [[P63Schedule alloc] initWithUID:@"lehoangvu"
                                     startPlace:@"Sài Gòn"
                               destinationPlace:@"Đà Lạt"
                                      startTime:startDate
                                        endTime:endDate
                                       distance:350
                                   expectedCost:350
                                       partners:nil];
    schedule.totalCost = 5300;
    schedule.totalTime = @"5 ngày 5 đêm";
    schedule.isFinish = YES;
    [_schedules addObject:schedule];
}

- (void)initPlaces {
    _places = [NSMutableArray arrayWithCapacity:8];
    
    P63Place* place = [[P63Place alloc] initWithPlaceName:@"Thành phố Vũng Tàu"
                                     fullPlaceDescription:@"Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu"
                                                starCount:4.2
                                            reviewerCount:304
                                             checkinCount:310
                                                   review:103
                                               lastUpdate:@"20/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Thành phố Đà Lạt"
                           fullPlaceDescription:@"Thành phố Đà Lạt, Lâm Đồng"
                                      starCount:4.2
                                  reviewerCount:725
                                   checkinCount:520
                                         review:243
                                     lastUpdate:@"26/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Mũi Cà Mau"
                           fullPlaceDescription:@"Mũi Cà Mau, Cà Mau"
                                      starCount:4.0
                                  reviewerCount:193
                                   checkinCount:103
                                         review:97
                                     lastUpdate:@"16/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Biển Lagi"
                           fullPlaceDescription:@"Biển Lagi, Lagi, Bình Thuận"
                                      starCount:4.0
                                  reviewerCount:405
                                   checkinCount:546
                                         review:230
                                     lastUpdate:@"22/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Coco Beach"
                           fullPlaceDescription:@"Coco Beach, Lagi, Bình Thuận"
                                      starCount:4.0
                                  reviewerCount:236
                                   checkinCount:299
                                         review:300
                                     lastUpdate:@"22/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Mũi Né"
                           fullPlaceDescription:@"Mũi Né, Phan Thiết, Bình Thuận"
                                      starCount:4.0
                                  reviewerCount:387
                                   checkinCount:408
                                         review:302
                                     lastUpdate:@"19/11/2018"];
    [_places addObject:place];
    
    place = [[P63Place alloc] initWithPlaceName:@"Đảo Phú Quý"
                           fullPlaceDescription:@"Đảo Phú Quý, Phú Quý, Bình Thuận"
                                      starCount:3.9
                                  reviewerCount:97
                                   checkinCount:89
                                         review:125
                                     lastUpdate:@"12/11/2018"];
    [_places addObject:place];
}

- (NSDate *)dateWithString:(NSString *)dateString dateFortmat:(NSString *)dateFormat {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    NSDate* date = [df dateFromString:dateString];
    return date;
}

@end
