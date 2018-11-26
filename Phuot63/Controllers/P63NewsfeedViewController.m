//
//  ViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/21/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63NewsfeedViewController.h"
#import "P63SampleDataPool.h"
#import "P63NewsfeedCell.h"

@interface P63NewsfeedViewController ()
< UITableViewDelegate
, UITableViewDataSource
, UISearchBarDelegate
, UISearchResultsUpdating
, UISearchControllerDelegate >

@property (weak, nonatomic) IBOutlet UITableView *newsfeedTableView;
@property (weak, nonatomic) P63SampleDataPool* sampleDataPool;
@property (nonatomic) UISearchController* searchController;
@property (nonatomic) UISearchBar* searchBar;

@end

@implementation P63NewsfeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(0, 0, 100, 10))];
    _searchBar.placeholder = @"Tìm kiếm lịch trình";
    self.navigationItem.titleView = _searchBar;
    self.extendedLayoutIncludesOpaqueBars = true;
    
    _newsfeedTableView.allowsSelection = NO;
    _sampleDataPool = [P63SampleDataPool sharedInstance];
    _newsfeedTableView.dataSource = self;
    _newsfeedTableView.delegate = self;
    _newsfeedTableView.separatorColor = [UIColor clearColor];
    
    [_newsfeedTableView reloadData];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView:)];
    [self.view addGestureRecognizer:tap];
}

- (void)didTapView:(UITapGestureRecognizer *)tapGesture {
    [_searchBar endEditing:YES];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem.width = 20;
}

#pragma mark - UISearchControllerDelegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = UIScreen.mainScreen.bounds;
    return 0.54*sqrt(rect.size.width*rect.size.width + rect.size.height*rect.size.height);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sampleDataPool.newsfeeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    P63NewsfeedCell* cell = (P63NewsfeedCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsfeedCell"];
    cell.newsfeed = [_sampleDataPool.newsfeeds objectAtIndex:indexPath.row];
    
    return cell;
}

@end
