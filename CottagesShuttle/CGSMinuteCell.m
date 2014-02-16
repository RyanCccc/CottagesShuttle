//
//  CGSMinuteCell.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSMinuteCell.h"



@implementation CGSMinuteCell


- (UIButton *)minuteButton
{
    if (_minuteButton == nil) {
        _minuteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_minuteButton setFrame:CGRectMake(230, 5, 80, self.bounds.size.height-10)];
        [_minuteButton setTitle:@"" forState:UIControlStateNormal];
    }
    return _minuteButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.contentView addSubview:self.minuteButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end