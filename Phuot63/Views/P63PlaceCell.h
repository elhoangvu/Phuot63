//
//  P63PlaceCell.h
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "P63Place.h"

NS_ASSUME_NONNULL_BEGIN

@interface P63PlaceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *starAndReviewer;
@property (weak, nonatomic) IBOutlet UILabel *checkinCount;
@property (weak, nonatomic) IBOutlet UILabel *reviewCount;
@property (weak, nonatomic) IBOutlet UILabel *lastUpdate;

@property (weak, nonatomic) P63Place* place;

@end

NS_ASSUME_NONNULL_END
