//
//  CGSStop.h
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGSStop : NSObject

@property (nonatomic, strong) NSDictionary *stopOptions;
@property (nonatomic, strong) NSDictionary *const locations;
@property (nonatomic, strong) NSDictionary *remainTime;
@property (nonatomic) NSInteger selectedStopIndex;

@end