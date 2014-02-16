//
//  CGSStop.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSStop.h"

@implementation CGSStop

- (id)init
{
    self = [super init];
    if (self) {
        self.selectedStopIndex = 0;
    }
    return self;
}

- (NSDictionary *)stopOptions
{
    if (_stopOptions == nil) {
        _stopOptions = @{@1: @"PHYS",
                         @2: @"EE",
                         @3: @"Church",
                         @4: @"Home"};
    }
    return _stopOptions;
}

@end
