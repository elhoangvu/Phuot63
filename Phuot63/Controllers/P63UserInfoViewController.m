//
//  P63UserInfoViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/28/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63UserInfoViewController.h"

@interface P63UserInfoViewController ()

@end

@implementation P63UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName: [UIFont systemFontOfSize:20 weight:UIFontWeightHeavy] };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
