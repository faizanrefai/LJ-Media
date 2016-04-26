//
//  I_am_LiveViewController.m
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "I_am_LiveViewController.h"

@implementation I_am_LiveViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terms & Conditions" message:@"I Am Live Application will use your current location and share with other application user."  delegate:self cancelButtonTitle:@"Accept" otherButtonTitles: @"Decline", nil];
	[alert show];
	[alert release];
}
-(void)viewWillAppear:(BOOL)animated{
	self.navigationController.navigationBar.hidden =TRUE;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if(buttonIndex==0){
	}
	else {
		
	}
}

-(IBAction)ClickOnLive:(id)sender{
	if(liveObj){
		liveObj =nil;
		[liveObj release];
	}
	self.navigationController.navigationBar.hidden =NO;
	liveObj =[[LiveView alloc]initWithNibName:@"LiveView" bundle:nil];
	[self.navigationController pushViewController:liveObj animated:YES];

}
-(IBAction)ClickOnUser:(id)sender{

	if(userProfileObj){
		userProfileObj =nil;
		[userProfileObj release];
	}
	self.navigationController.navigationBar.hidden =NO;
	userProfileObj =[[UserProfileView alloc]initWithNibName:@"UserProfileView" bundle:nil];
	[self.navigationController pushViewController:userProfileObj animated:YES];
	
	

}
-(IBAction)ClickOnRanking:(id)sender{
	if(rankingObj){
		rankingObj =nil;
		[rankingObj release];
	}
	self.navigationController.navigationBar.hidden =NO;
	rankingObj =[[RankingView alloc]initWithNibName:@"RankingView" bundle:nil];
	[self.navigationController pushViewController:rankingObj animated:YES];
}

-(IBAction)ClickOnPromo:(id)sender{
	if(promoObj){
		promoObj =nil;
		[promoObj release];
	}
	self.navigationController.navigationBar.hidden =NO;
	promoObj =[[PromoView alloc]initWithNibName:@"PromoView" bundle:nil];
	[self.navigationController pushViewController:promoObj animated:YES];
	
}
-(IBAction)ClickOnOption:(id)sender{	
	if(optionObj){
		optionObj =nil;
		[optionObj release];
	}
	self.navigationController.navigationBar.hidden =NO;
	optionObj =[[optionView alloc]initWithNibName:@"optionView" bundle:nil];
	[self.navigationController pushViewController:optionObj animated:YES];

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[optionObj release];
	[promoObj release];
	[userProfileObj release];
	[liveObj release];
	[rankingObj release];
    [super dealloc];
}

@end
