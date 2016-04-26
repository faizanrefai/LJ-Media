//
//  I_am_LiveViewController.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "optionView.h"
#import "RankingView.h"
#import "UserProfileView.h"
#import "PromoView.h"
#import "LiveView.h"

@interface I_am_LiveViewController : UIViewController<UIAlertViewDelegate> {
	optionView *optionObj;
	UserProfileView *userProfileObj;
	RankingView *rankingObj;
	PromoView *promoObj;
	LiveView *liveObj;
}

-(IBAction)ClickOnLive:(id)sender;
-(IBAction)ClickOnUser:(id)sender;
-(IBAction)ClickOnRanking:(id)sender;
-(IBAction)ClickOnPromo:(id)sender;
-(IBAction)ClickOnOption:(id)sender;


@end

