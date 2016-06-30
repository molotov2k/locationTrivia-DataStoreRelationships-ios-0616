//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISAddTriviaViewController.h"

@interface FISTriviaTableViewController ()

@end


@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccessibility];

}


-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.location.trivia.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    FISTrivium *trivium = self.location.trivia[indexPath.row];
    cell.textLabel.text = trivium.content;
    
    return cell;
}


- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *destinationNC = segue.destinationViewController;
    FISAddTriviaViewController *destinationVC = (FISAddTriviaViewController *)destinationNC.topViewController;
    destinationVC.location = self.location;
}


- (void) setAccessibility {
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
}

@end
