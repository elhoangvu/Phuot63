//
//  UserInfo.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface P63UserInfo : NSObject

@property (nonatomic, readonly) NSString* uid;
@property (nonatomic, readonly) NSString* displayname;
@property (nonatomic, readonly) UIImage* avatar;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
