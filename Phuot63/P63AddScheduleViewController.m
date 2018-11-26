//
//  AddScheduleViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/26/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63AddScheduleViewController.h"

@interface P63AddScheduleViewController ()
< UITableViewDelegate
, UITableViewDataSource >

@property (weak, nonatomic) IBOutlet UITableView *addScheduleTableView;

@end

@implementation P63AddScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    _addScheduleTableView.delegate = self;
    _addScheduleTableView.dataSource = self;
    _addScheduleTableView.separatorColor = [UIColor clearColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 310;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AddScheduleCell"];
    return cell;
}

- (IBAction)didTapCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
