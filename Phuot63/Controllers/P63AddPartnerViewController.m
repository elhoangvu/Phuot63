//
//  AddPartnerViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 1/8/19.
//  Copyright © 2019 Le Hoang Vu. All rights reserved.
//

#import "P63AddPartnerViewController.h"
#import "P63SampleDataPool.h"
#import "P63PartnerCell.h"
#import "P63CreateScheduleCell.h"

@interface P63AddPartnerViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *partnerTableView;
@property (nonatomic) NSArray* partners;

@end

@implementation P63AddPartnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _partnerTableView.delegate = self;
    _partnerTableView.dataSource = self;
    _partnerTableView.editing = YES;
    _partnerTableView.allowsMultipleSelection = YES;
    _partnerTableView.allowsMultipleSelectionDuringEditing = YES;
    _selectedPartners = [NSMutableArray array];
    _partners = P63SampleDataPool.sharedInstance.users;
    _partnerTableView.separatorColor = [UIColor clearColor];
    for (UIView *subview in self.searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
        for (UIView *subsubview in subview.subviews) {
            if ([subsubview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [subsubview removeFromSuperview];
                break;
            }
        }
    }
    UIColor* color = [UIColor colorWithRed:29.0f/255.0f green:161.0f/255.0f blue:242.0f/255.0f alpha:0.9f];
    self.searchBar.barTintColor = color;
    self.searchBar.backgroundColor = color;
    
//    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView:)];
//    [self.view addGestureRecognizer:tap];
}

- (void)didTapView:(UITapGestureRecognizer *)tapGesture {
    [_searchBar endEditing:YES];
}

- (IBAction)didTapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)didTapDoneButton:(id)sender {
    P63CreateScheduleCell* root = (P63CreateScheduleCell *)_root;
    [root didEndSelectPartner:_selectedPartners];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _partners.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_selectedPartners addObject:[_partners objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_selectedPartners removeObject:[_partners objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    P63PartnerCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AddPartnerCell"];
    P63UserInfo* user = (P63UserInfo *)[_partners objectAtIndex:indexPath.row];
    cell.name.text = user.displayname;
    cell.avatar.image = user.avatar;
    cell.avatar.layer.cornerRadius = 20;
    
    cell.avatar.clipsToBounds = YES;
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = view;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
