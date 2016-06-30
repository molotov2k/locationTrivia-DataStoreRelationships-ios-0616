//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsDataStore.h"

@interface FISLocationsTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *store;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButtonLabel;


@end


@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccessibility];
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    [self generateStartingLocationsData];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    FISLocation *selectedLocation = self.store.locations[indexPath.row];
    cell.textLabel.text = selectedLocation.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", selectedLocation.trivia.count];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        UINavigationController *destinationNC = segue.destinationViewController;
        FISTriviaTableViewController *destinationVC = (FISTriviaTableViewController *)destinationNC.topViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FISLocation *selectedLocation = self.store.locations[indexPath.row];
        destinationVC.location = selectedLocation;
    }
}


- (void)setAccessibility {
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
}


- (void)generateStartingLocationsData {
    FISLocation *empireState = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                        latitude:40.7484
                                                       longitude:-73.9857];
    
    FISTrivium *trivium1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivium1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    
    [empireState.trivia addObjectsFromArray:@[trivium1A, trivium1B]];
    
    FISLocation *bowlingGreen = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                         latitude:41.3739
                                                        longitude:-83.6508];
    
    FISTrivium *trivium2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivium2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivium2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    
    
    [bowlingGreen.trivia addObjectsFromArray:@[trivium2A, trivium2B, trivium2C]];
    
    FISLocation *ladyLiberty = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                        latitude:40.6892
                                                       longitude:74.0444];
    FISTrivium *trivium3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    
    [ladyLiberty.trivia addObjectsFromArray:@[trivium3A]];
    
    [self.store.locations addObjectsFromArray:@[bowlingGreen, empireState, ladyLiberty]];
}

@end
