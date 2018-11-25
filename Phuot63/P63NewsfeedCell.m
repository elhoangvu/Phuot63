//
//  NewsfeedCell.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/25/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63NewsfeedCell.h"

@implementation P63NewsfeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNewsfeed:(P63Newsfeed *)newsfeed {
    _newsfeed = newsfeed;
    _avatar.image = newsfeed.avatar;
    _avatar.layer.cornerRadius = _avatar.frame.size.height*0.5f;
    _avatar.clipsToBounds = YES;
    _name.text = newsfeed.name;
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"dd/MM/yyyy"];
    NSString* date = [df stringFromDate:_newsfeed.postedTime];
    _postedTime.text = date;
    if (newsfeed.photos) {
        _photo.image = [newsfeed.photos objectAtIndex:0];
    }
    _title.text = newsfeed.title;
//    _bookmark.image =
    _cost.text = [NSString stringWithFormat:@"%ld K", (long)newsfeed.cost];
    _duration.text = newsfeed.duration;
    _content.text = newsfeed.content;
    _likes.text = [NSString stringWithFormat:@"%ld", (long)newsfeed.likes];
    _comments.text = [NSString stringWithFormat:@"%ld", (long)newsfeed.comments];
    _shares.text = [NSString stringWithFormat:@"%ld", (long)newsfeed.bookmarks];
}

@end
