//
//  CGSStatusCell.h
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGSStatusCell : UITableViewCell

@property (strong,nonatomic)NSMutableAttributedString *statusText;
- (void)setString:(NSString *)aString;

@end
