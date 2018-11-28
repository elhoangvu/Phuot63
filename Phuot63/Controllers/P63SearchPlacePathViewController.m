//
//  P63SearchPlacePathViewController.m
//  Phuot63
//
//  Created by Le Hoang Vu on 11/28/18.
//  Copyright © 2018 Le Hoang Vu. All rights reserved.
//

#import "P63SearchPlacePathViewController.h"
#import "P63SampleDataPool.h"

@interface P63SearchPlacePathViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *startPlace;
@property (weak, nonatomic) IBOutlet UITextField *destinationPlace;


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic) CGFloat topConstraintConstant;
@property (nonatomic) NSArray* addressPlaces;
@property (nonatomic) BOOL isFocusStartPlace;
@property (nonatomic) BOOL isFocusDestinationPlace;

@end

@implementation P63SearchPlacePathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    _addressPlaces = [[P63SampleDataPool sharedInstance] addressPlaces];
    _isFocusDestinationPlace = NO;
    _isFocusStartPlace = NO;
    
    if (_startPlaceString && _destinationPlaceString) {
        _startPlace.text = _startPlaceString;
        _destinationPlace.text = _destinationPlaceString;
    }
    
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeView:)];
    [self.view addGestureRecognizer:swipe];
    if (_isSelectStartPlace) {
        [_startPlace becomeFirstResponder];
    } else {
        [_destinationPlace becomeFirstResponder];
    }
   
}

- (void)didSwipeView:(UISwipeGestureRecognizer *)tapGesture {
    [_startPlace endEditing:YES];
    [_destinationPlace endEditing:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_startPlace resignFirstResponder];
    [_destinationPlace resignFirstResponder];
//    [_startPlace endEditing:YES];
//    [_destinationPlace endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setStartPlaceTextField:_startPlace];
    [self setStartPlaceTextField:_destinationPlace];
    _topConstraintConstant = _topConstraint.constant;
    _topConstraint.constant = _topOffset;
    [self.view layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.topConstraint.constant = weakSelf.topConstraintConstant;
        [weakSelf.view layoutIfNeeded];
    }];
}

- (void)setStartPlaceTextField:(UITextField *)textField {
    textField.layer.cornerRadius = textField.frame.size.height*0.5f;
    textField.layer.borderWidth = 0.25;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.clipsToBounds = YES;
}

- (IBAction)didTapBackButton:(id)sender {
    [_parentVC didEndEditingWithStartPlace:_startPlace.text destinationPlace:_destinationPlace.text];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.topConstraint.constant = weakSelf.topOffset;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isFocusStartPlace) {
        return _addressPlaces.count + 1;
    }
    return _addressPlaces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AddressCell"];
    if (_isFocusStartPlace) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Vị trí của tôi";
        } else {
            cell.textLabel.text = [_addressPlaces objectAtIndex:indexPath.row - 1];
        }
        return cell;
    }
    cell.textLabel.text = [_addressPlaces objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isFocusStartPlace) {
        if (indexPath.row == 0) {
            NSString* curLocation = [P63SampleDataPool sharedInstance].currentLocation;
            _startPlace.text = curLocation;
        } else {
            _startPlace.text = [_addressPlaces objectAtIndex:indexPath.row];
        }
    } else if (_isFocusDestinationPlace) {
        _destinationPlace.text = [_addressPlaces objectAtIndex:indexPath.row];
    }
}

- (IBAction)didBeginEditing:(UITextField *)sender {
    if (sender.tag == 0) {
        _isFocusStartPlace = YES;
    } else {
        _isFocusDestinationPlace = YES;
    }
    [_tableView reloadData];
}

- (IBAction)didEndEditing:(UITextField *)sender {
    if (sender.tag == 0) {
        _isFocusStartPlace = NO;
    } else {
        _isFocusDestinationPlace = NO;
    }
}

@end

