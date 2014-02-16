//
//  CGSUserSetting.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSUserSetting.h"

@implementation CGSUserSetting



- (NSDictionary *)minsOption
{
    if (_minsOption == nil) {
        _minsOption = @{@"1 MIN":@1,
                        @"2 MINS":@2,
                        @"3 MINS":@3,
                        @"4 MINS":@4,
                        @"5 MINS":@5};
    }
    return _minsOption;
}

- (void)setMyMin:(NSString*)min
{
    self.min = [[self.minsOption valueForKey:min]intValue];
}


@end
