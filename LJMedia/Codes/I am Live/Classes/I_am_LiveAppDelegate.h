//
//  I_am_LiveAppDelegate.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashView.h"

@interface I_am_LiveAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *AppController;
	SplashView *splashObj;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *AppController;

@end

