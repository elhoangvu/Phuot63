//
//  UserInfo.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63UserInfo.h"

@implementation P63UserInfo

+ (instancetype)sharedInstance {
    static P63UserInfo* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[P63UserInfo alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    [self initUserInfo];
    
    return self;
}

- (void)initUserInfo {
    _userID = @"lehoangvu";
    _displayname = @"Lê Hoàng Vũ";
    _avatar = [UIImage imageNamed:@"11111111"];
}

@end
