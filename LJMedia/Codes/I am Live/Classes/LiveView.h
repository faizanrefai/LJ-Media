//
//  LiveView.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Userinfo_map.h"


@interface LiveView : UIViewController<MKMapViewDelegate,UIPickerViewDelegate,UIAccelerometerDelegate> {
	IBOutlet UIView *topView;
	IBOutlet UIView *camera_view;
	IBOutlet UIButton *togglebutton;
	IBOutlet UIButton *uparrow;
	IBOutlet MKMapView *mp;
	NSString *currentstr;
	IBOutlet UIPickerView *dPicker;
	IBOutlet UIToolbar *dpickertoolbar;
	IBOutlet UILabel *groupLbl;;
	IBOutlet UILabel *radiousLabl;
	NSArray *groupArr;
	NSArray*radiousArr;
	Userinfo_map *objUser;
	

}
-(IBAction)onBack:(id)sender;
-(IBAction)onDown:(id)sender;
-(IBAction)onRadious:(id)sender;
-(IBAction)onGroup:(id)sender;
-(IBAction)onPost:(id)sender;
-(IBAction)onLocate:(id)sender;
-(IBAction)ontogglebutton:(id)sender;
-(IBAction)oncancel:(id)sender;
-(IBAction)onselect:(id)sender;

@end
