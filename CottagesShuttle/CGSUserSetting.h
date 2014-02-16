//
//  CGSUserSetting.h
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGSUserSetting : NSObject

@property (nonatomic, strong) NSDictionary *minsOption;

@property (nonatomic) NSInteger min;

@property (nonatomic) BOOL shouldNotify;

- (void)setMyMin:(NSString *)min;

@end
