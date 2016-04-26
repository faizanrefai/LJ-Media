//
//  MainViewController.h
//  ARKitDemo
//
//  Created by Niels Hansen on 9/11/11.
//  Copyright 2011 Agilite Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MainViewController : UIViewController<ARLocationDelegate> {
    ARViewController *cameraViewController;
    UIViewController *infoViewController;
    
    IBOutlet UIButton *dragButton; 
    UIButton *duplicateButton;
    
}

-(IBAction) displayAR:(id) sender;

@property (nonatomic, retain) ARViewController *cameraViewController;
@property (nonatomic, retain) UIViewController *infoViewController;

@property (retain, nonatomic) IBOutlet UISwitch *ScaleOnDistance;

@property (retain, nonatomic) IBOutlet UISwitch *DebugModeSwitch;

@end
