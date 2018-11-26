//
//  Newsfeed.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63Newsfeed.h"

@implementation P63Newsfeed

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
                   bookmarks:(NSInteger)bookmarks {
    if (!(self = [super init])) {
        return nil;
    }
    
    _name           = name;
    _uid            = uid;
    _postedTime     = postedTime;
    _avatar         = avatar;
    _photos         = photos;
    _title          = title;
    _cost           = cost;
    _duration       = duration;
    _content        = content;
    _isBookmarked   = isBookmarked;
    _isLiked        = isLiked;
    _likes          = likes;
    _comments       = comments;
    _bookmarks      = bookmarks;
    
    return self;
}

@end
