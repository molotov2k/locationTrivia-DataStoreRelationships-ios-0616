//
//  FISLocationsDataStore.m
//  locationTrivia-dataStore
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsDataStore.h"

@implementation FISLocationsDataStore


- (instancetype)init
{
    self = [super init];
    if (self) {
        _locations = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (instancetype)sharedLocationsDataStore {
    static FISLocationsDataStore *_sharedLocationsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLocationsDataStore = [[FISLocationsDataStore alloc] init];
    });
    
    return _sharedLocationsDataStore;
}




@end
