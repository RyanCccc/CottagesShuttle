//
//  CGSStatusCell.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-23.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSStatusCell.h"

@implementation CGSStatusCell

- (NSMutableAttributedString *)statusText
{
    if (_statusText == nil) {
        _statusText = [[NSMutableAttributedString alloc] initWithString:@"cuo le"];
        [_statusText setAttributes:@{ NSStrokeWidthAttributeName : @3,
                                      NSStrokeColorAttributeName : [UIColor redColor] }
                             range:NSMakeRange(0, [_statusText length])];
    }
    return _statusText;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.detailTextLabel.attributedText = self.statusText;
    }
    return self;
}

- (void)setString:(NSString *)aString
{
    [self.statusText replaceCharactersInRange:NSMakeRange(0, [self.statusText length])
                                   withString:aString];
    self.detailTextLabel.attributedText = self.statusText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
