//
//  CGSSettingViewController.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-22.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSSettingViewController.h"
#import "CGSSwitchTableViewCell.h"
#import "CGSStatusCell.h"
#import "CGSMinuteCell.h"
#import "MMPickerView.h"
#import "CGSStop.h"
#import "CGSUserSetting.h"

@interface CGSSettingViewController ()
@property (nonatomic, strong) NSString * selectedString;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) CGSMinuteCell *minCell;
@property (nonatomic, strong) CGSSwitchTableViewCell *switchCell;

@property (nonatomic, strong) CGSUserSetting *setting;
@property (nonatomic, strong) CGSStop *stops;

@end

@implementation CGSSettingViewController

- (CGSUserSetting *)setting
{
    if (_setting == nil) {
        _setting =[[CGSUserSetting alloc]init];
    }
    return _setting;
}

- (CGSStop *)stops
{
    if (_stops == nil) {
        _stops = [[CGSStop alloc]init];
    }
    return _stops;
}

- (CGSMinuteCell *)minCell
{
    if (_minCell == nil) {
        _minCell = [[CGSMinuteCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"optionCell"];
        _minCell.textLabel.text = @"Get notified in advance";
        [[_minCell minuteButton]setTitle:self.selectedString forState:UIControlStateNormal];
        [[_minCell minuteButton]addTarget:self action:@selector(minuteButtonOnClicked:) forControlEvents:UIControlEventTouchDown];
    }
    return _minCell;
}

- (CGSSwitchTableViewCell *)switchCell
{
    if (_switchCell == nil) {
        _switchCell = [[CGSSwitchTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"switchCell"];
        _switchCell.textLabel.text = @"I want to get the notification";
        [[_switchCell mySwitch] addTarget:self action:@selector(setState:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchCell;
}

- (void)setSelectedString:(NSString *)selectedString
{
    _selectedString = selectedString;
    [self.setting setMyMin: selectedString];
    [[_minCell minuteButton]setTitle:_selectedString forState:UIControlStateNormal];
    [_minCell setNeedsDisplay];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.tableView.contentInset = UIEdgeInsetsMake(0.,
                                                   0.,
                                                   CGRectGetHeight(self.tabBarController.tabBar.frame)+10,
                                                   0);
    self.selectedString = [[[self.setting.minsOption allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:0];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)minuteButtonOnClicked:(id)sender
{
    [MMPickerView showPickerViewInView:self.view
                           withStrings: [[self.setting.minsOption allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]
                           withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                                         MMtextColor: [UIColor blackColor],
                                         MMtoolbarColor: [UIColor whiteColor],
                                         MMbuttonColor: [UIColor blueColor],
                                         MMfont: [UIFont systemFontOfSize:18],
                                         MMvalueY: @2,
                                         MMselectedObject:self.selectedString,
                                         MMtextAlignment:@1}
                            completion:^(NSString *selectedString) {
                                self.selectedString = selectedString;
                            }];
}

- (void)setState:(id)sender
{
    self.setting.shouldNotify = [sender isOn];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = indexPath.section>0?@"timeCell":indexPath.row == 0?@"switchCell":@"optionCell";
    if (![cellID isEqualToString:@"timeCell"] && indexPath.row==2) {
        cellID = @"stopCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if ([cellID isEqualToString:@"optionCell"]) {
        cell = self.minCell;
    }else if ([cellID isEqualToString:@"switchCell"]){
        cell = self.switchCell;
    }
    else if (cell == nil) {
        cell = [[CGSStatusCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    int selectedStop = (indexPath.section-1)*3 + indexPath.row + 1;

    // Set Content
    if ([cellID isEqualToString:@"timeCell"]) {
        <#statements#>
    }
    
    // Select Stop
        if (selectedStop == self.stops.selectedStopIndex && self.stops.selectedStopIndex!=0) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 3;
    }
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        self.stops.selectedStopIndex = 4;
    }else if(indexPath.section == 1) {
        self.stops.selectedStopIndex = indexPath.row+1;
    }
    [tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Notification";
    }else if (section == 1){
        return @"Go to school";
    }
    return @"Go home";
}
@end