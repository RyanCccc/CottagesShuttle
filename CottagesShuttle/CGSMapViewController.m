//
//  CGSMapViewController.m
//  CottagesShuttle
//
//  Created by Rendong Chen on 13-11-22.
//  Copyright (c) 2013年 Rendong Chen. All rights reserved.
//

#import "CGSMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface CGSMapViewController ()

@end

@implementation CGSMapViewController

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
	// Do any additional setup after loading the view.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:41.887
                                                            longitude:-87.622
                                                                 zoom:15];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(41.887, -87.622);
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [UIImage imageNamed:@"flag_icon"];
    marker.snippet = @"xiaonaio";
    marker.map = mapView;
    self.view = mapView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
