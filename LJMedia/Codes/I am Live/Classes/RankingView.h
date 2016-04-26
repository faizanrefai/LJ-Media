//
//  RankingView.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankingDetilView.h"


@interface RankingView : UIViewController <UIPickerViewDelegate>{
	IBOutlet UITableView *userRanking;
	RankingDetilView *objRankingdetail;
	IBOutlet UIPickerView *pvController;
	IBOutlet UIToolbar *pickertoolbar;
	NSString *current_str;
	IBOutlet UILabel *optionBtn;
	NSArray *dropdownarr;
	

}
-(IBAction)onUser:(id)sender;
-(IBAction)onOption:(id)sender;
-(IBAction)onselect:(id)sender;
-(IBAction)onCancel:(id)sender;

@end
