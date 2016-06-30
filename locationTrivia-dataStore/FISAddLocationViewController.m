//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocation.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButtonLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButtonLabel;

@property (strong, nonatomic) FISLocationsDataStore *store;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccessibility];
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
}


- (IBAction)saveButtonAction:(id)sender {
    FISLocation *savedLocation = [[FISLocation alloc] init];
    savedLocation.name = self.nameField.text;
    savedLocation.latitude = [self.latitudeField.text floatValue];
    savedLocation.longitude = [self.longitudeField.text floatValue];
    [self.store.locations addObject:savedLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setAccessibility {
    self.nameField.accessibilityLabel = @"nameField";
    self.nameField.accessibilityIdentifier = @"nameField";
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    self.longitudeField.accessibilityLabel = @"longitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    self.saveButtonLabel.accessibilityLabel = @"saveButton";
    self.saveButtonLabel.accessibilityIdentifier = @"saveButton";
    self.cancelButtonLabel.accessibilityLabel = @"cancelButton";
    self.cancelButtonLabel.accessibilityIdentifier = @"cancelButton";
}


@end
