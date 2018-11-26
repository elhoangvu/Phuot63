//
//  P63ManagePlaceViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/27/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63ManagePlaceViewController.h"
#import "P63SampleDataPool.h"
#import "P63PlaceCell.h"

@interface P63ManagePlaceViewController () <UISearchBarDelegate>

@property (nonatomic) NSArray* places;
@property (nonatomic) NSArray* renderPlaces;
@property (nonatomic) UISearchBar* searchBar;

@end

@implementation P63ManagePlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _places = [P63SampleDataPool sharedInstance].places;
    _places = [_places sortedArrayUsingComparator:^NSComparisonResult(P63Place*  _Nonnull place1, P63Place*  _Nonnull place2) {
        return place1.starCount < place2.starCount;
    }];
    _renderPlaces = _places;
    self.tableView.separatorColor = [UIColor clearColor];
    _searchBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(0, 0, 100, 10))];
    _searchBar.placeholder = @"Tìm kiếm địa điểm";
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    self.extendedLayoutIncludesOpaqueBars = true;
    
    NSUInteger fontSize = 14;
    UIFont* font = [UIFont systemFontOfSize:fontSize];
    NSDictionary* attributes = @{ NSFontAttributeName: font };
    UIBarButtonItem* rightButton = self.navigationItem.rightBarButtonItem;
    [rightButton setTitleTextAttributes:attributes forState:UIControlStateNormal];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIView* subview in self.navigationItem.titleView.subviews) {
        for (UIView* subsubview in subview.subviews) {
            if (subsubview.superclass == UITextField.class) {
                CGRect frame = subsubview.frame;
                frame.size.height = frame.size.height*0.9f;
                frame.origin.y += frame.size.height*0.05f;
                subsubview.frame = frame;
                subsubview.layer.cornerRadius = subsubview.frame.size.height/2.0;
                subsubview.clipsToBounds = YES;
                subsubview.layer.masksToBounds = YES;
                UITextField* textField = (UITextField *)subsubview;
                [(UITextField *)subsubview setFont:[textField.font fontWithSize:14]];
            }
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 127;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _renderPlaces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    P63PlaceCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PlaceCell"];
    cell.place = [_renderPlaces objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)didTapCurrentLocationButton:(id)sender {
    NSString* currentLocation = [P63SampleDataPool sharedInstance].currentLocation;
    _searchBar.text = currentLocation;
    [_searchBar.delegate searchBar:_searchBar textDidChange:currentLocation];
}

- (IBAction)didTapTrendingButton:(id)sender {
    NSString* text = @"Xu hướng";
    _searchBar.text = text;
    [_searchBar.delegate searchBar:_searchBar textDidChange:text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText == nil || [searchText isEqualToString:@""]) {
        _renderPlaces = _places;
        [self.tableView reloadData];
        return;
    }

    NSMutableArray* suggestPlaces = [NSMutableArray array];
    
    if ([searchText isEqualToString:@"Xu hướng"]) {
        [_places enumerateObjectsUsingBlock:^(P63Place*  _Nonnull place, NSUInteger idx, BOOL * _Nonnull stop) {
            if (place.starCount >= 4.0) {
                [suggestPlaces addObject:place];
            }
        }];
    } else {
        searchText = [searchText uppercaseString];
        
        [_places enumerateObjectsUsingBlock:^(P63Place*  _Nonnull place, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([[place.fullPlaceDescription uppercaseString] containsString:[searchText uppercaseString]]) {
                [suggestPlaces addObject:place];
            }
        }];
    }

    _renderPlaces = suggestPlaces;
    [self.tableView reloadData];
    if (_renderPlaces.count > 0) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
    }
}

@end
