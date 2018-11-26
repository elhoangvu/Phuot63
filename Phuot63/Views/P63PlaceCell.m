//
//  P63PlaceCell.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63PlaceCell.h"

@implementation P63PlaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPlace:(P63Place *)place {
    _title.text = place.placeName;
    _placeImageView.image = place.placeImage;
    _starAndReviewer.text = [NSString stringWithFormat:@"%.1f (%ld)", place.starCount, (long)place.reviewerCount];
    _checkinCount.text = [NSString stringWithFormat:@"%lu người đã check-in tại đây", place.checkinCount];
    _reviewCount.text = [NSString stringWithFormat:@"%lu bài đánh giá", place.review];
    _lastUpdate.text = [NSString stringWithFormat:@"Cập nhật lần cuối %@", place.lastUpdate];
    
    _place = place;
}

@end
