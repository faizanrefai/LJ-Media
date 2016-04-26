//
//  RankingDetilView.h
//  I am Live
//
//  Created by Openxcelltech on 4/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ranking_cell.h"


@interface RankingDetilView : UIViewController <UIPickerViewDelegate>{
	NSString *titleStr;
	IBOutlet UITableView *detailtable;
	NSArray *detailcaption;
	NSArray *detaildescription;
	NSArray *dropdownarr;
	NSString *currentstr;
	IBOutlet UIPickerView *pvController;
	IBOutlet UIToolbar *pickertoolbar;
	int current_tag;
	
	

}

@property(nonatomic ,retain)NSString *titleStr;
-(IBAction)onselect:(id)sender;
-(IBAction)onCancel:(id)sender;

@end
