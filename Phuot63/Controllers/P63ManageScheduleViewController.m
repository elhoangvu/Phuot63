//
//  P63ManageScheduleViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63ManageScheduleViewController.h"
#import "P63SampleDataPool.h"
#import "P63ScheduleCell.h"

@interface P63ManageScheduleViewController ()

@property (nonatomic) NSArray* schedules;
@property (nonatomic) NSInteger lastScheduleCount;

@end

@implementation P63ManageScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName: [UIFont systemFontOfSize:20 weight:UIFontWeightHeavy] };
    self.tableView.separatorColor = [UIColor clearColor];
    
    _schedules = [P63SampleDataPool sharedInstance].schedules;
    _lastScheduleCount = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if (_lastScheduleCount < _schedules.count) {
//        NSIndexPath* indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexpath] withRowAnimation:(UITableViewRowAnimationLeft)];
//    }
//    _lastScheduleCount = _schedules.count;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _schedules.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    P63ScheduleCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleCell"];
    cell.schedule = [_schedules objectAtIndex:_schedules.count - indexPath.row - 1];
    
    return cell;
}


@end
