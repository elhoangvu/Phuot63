//
//  Newsfeed.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface P63Newsfeed : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* uid;
@property (nonatomic) NSDate* postedTime;
@property (nonatomic) UIImage* avatar;
@property (nonatomic) NSArray* photos;
@property (nonatomic) NSString* title;
@property (nonatomic) NSInteger cost;
@property (nonatomic) NSString* duration;
@property (nonatomic) NSString* content;
@property (nonatomic) BOOL isBookmarked;
@property (nonatomic) BOOL isLiked;
@property (nonatomic) NSInteger likes;
@property (nonatomic) NSInteger comments;
@property (nonatomic) NSInteger bookmarks;

- (instancetype)initWithName:(NSString *)name
                         uid:(NSString *)uid
                  postedTime:(NSDate *)postedTime
                      avatar:(UIImage *)avatar
                      photos:(NSArray *)photos
                       title:(NSString *)title
                        cost:(NSInteger)cost
                    duration:(NSString *)duration
                     content:(NSString *)content
                isBookmarked:(BOOL)isBookmarked
                     isLiked:(BOOL)isLiked
                       likes:(NSInteger)likes
                    commnets:(NSInteger)comments
                   bookmarks:(NSInteger)bookmarks;

@end

NS_ASSUME_NONNULL_END
