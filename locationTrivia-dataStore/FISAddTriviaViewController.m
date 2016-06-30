//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddTriviaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triviaTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButtonLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButtonLabel;

@property (strong, nonatomic) FISLocationsDataStore *store;

@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccessibility];
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
}


- (IBAction)saveButtonAction:(id)sender {
    FISTrivium *newTrivium = [[FISTrivium alloc] init];
    newTrivium.content = self.triviaTextField.text;
    for (FISLocation *savedLocation in self.store.locations) {
        if ([savedLocation isEqual:self.location]) {
            [savedLocation.trivia addObject:newTrivium];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setAccessibility {
    self.triviaTextField.accessibilityLabel = @"Trivium Text Field";
    self.triviaTextField.accessibilityIdentifier = @"Trivium Text Field";
    self.saveButtonLabel.accessibilityLabel = @"Save Button";
    self.saveButtonLabel.accessibilityIdentifier = @"Save Button";
    self.cancelButtonLabel.accessibilityLabel = @"Cancel Button";
    self.cancelButtonLabel.accessibilityIdentifier = @"Cancel Button";
}


@end
