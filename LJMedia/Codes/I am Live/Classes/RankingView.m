//
//  RankingView.m
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RankingView.h"


@implementation RankingView


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title =@"Ranking";
	current_str =@"MILESHUNTER";
	optionBtn.text =[current_str retain];
	dropdownarr  =[[NSArray alloc] initWithObjects:@"MILESHUNTER",@"GLOBETROTTER"@"TIMETRAVELER",@"CHAMPIONSLEAGUE",nil];
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(onHome:)];
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;

}

-(IBAction)onHome:(id)sender{
	[self.navigationController popToRootViewControllerAnimated:YES];
	
}

-(IBAction)onUser:(id)sender{
	if (objRankingdetail) {
		objRankingdetail =nil;
		[objRankingdetail release];
	}
	objRankingdetail =[[RankingDetilView alloc]initWithNibName:@"RankingDetilView" bundle:nil];
	objRankingdetail.titleStr  = @"Mark";
	[self.navigationController pushViewController:objRankingdetail animated:YES];
	

}
-(IBAction)onOption:(id)sender{
	pvController.hidden =FALSE;
	pickertoolbar.hidden =FALSE;


}
-(IBAction)onselect:(id)sender{
	optionBtn.text =[current_str retain];
	//[optionBtn setTitle:current_str forState:UIControlStateNormal];
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;
	
}
-(IBAction)onCancel:(id)sender{
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;
	
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    current_str=    [dropdownarr objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [dropdownarr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [dropdownarr objectAtIndex:row];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text =[NSString stringWithFormat:@"User %d",indexPath.row+1];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (objRankingdetail) {
		objRankingdetail =nil;
		[objRankingdetail release];
	}
	objRankingdetail =[[RankingDetilView alloc]initWithNibName:@"RankingDetilView" bundle:nil];
	objRankingdetail.titleStr = [NSString stringWithFormat:@"User %d",indexPath.row+1];
	[self.navigationController pushViewController:objRankingdetail animated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
