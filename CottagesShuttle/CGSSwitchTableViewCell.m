//
//  CGSSwitchTableViewCell.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSSwitchTableViewCell.h"

@implementation CGSSwitchTableViewCell

- (UISwitch *)mySwitch
{
    if (_mySwitch == nil) {
        _mySwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
        CGRect frame = _mySwitch.frame;
        frame.origin.x = 240;
        frame.origin.y = 9;
        _mySwitch.frame = frame;
        _mySwitch.tag = 1;
    }
    return _mySwitch;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.contentView addSubview:self.mySwitch];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
