//
//  NewsfeedCell.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "P63Newsfeed.h"

NS_ASSUME_NONNULL_BEGIN

@interface P63NewsfeedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *uidAndpostedTime;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *slide;
@property (weak, nonatomic) IBOutlet UIImageView *costImage;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UIImageView *durationImage;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *likeImage;
@property (weak, nonatomic) IBOutlet UILabel *likes;
@property (weak, nonatomic) IBOutlet UIImageView *commentImage;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UIImageView *shareImage;
@property (weak, nonatomic) IBOutlet UILabel *shares;

@property (weak, nonatomic) P63Newsfeed* newsfeed;

@end

NS_ASSUME_NONNULL_END
