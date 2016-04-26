//
//  RankingDetilView.m
//  I am Live
//
//  Created by Openxcelltech on 4/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RankingDetilView.h"


@implementation RankingDetilView
@synthesize titleStr;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Ranking Detail";
	currentstr=@"Yearly";
	detailcaption = [[NSArray alloc] initWithObjects:@"I Am Points",@"Distance tracked by I AM APP ",@"Total Distance Travelled",@"No of visited countries",@"Days in foriign country",@"Countries travelled to:",nil];
	detaildescription =[[NSArray alloc] initWithObjects:@"165 points",@"1265 KMs",@"1356 KMs",@"4 countries",@"220 days",@"Germany,Canada,Brazil,Japan",nil];
	dropdownarr =[[NSArray alloc] initWithObjects:@"Yearly",@"Monthly",@"Total",nil];
	[detailcaption retain];
	[detaildescription retain];
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [detailcaption count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{	
		return [NSString stringWithFormat:@"%@'s Detail", titleStr];
		
}		


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"ranking_cell";
    
    ranking_cell *cell = (ranking_cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ranking_cell" owner:nil options:nil];
		cell = [nib objectAtIndex:0];	
		[cell.optionBtn setTitle:currentstr forState:UIControlStateNormal];
    }
	cell.optionBtn.tag = indexPath.row;
	

	[cell.optionBtn addTarget:self action:@selector(optionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
	cell.t_lable.text =[NSString stringWithFormat:@"%@",[ detailcaption objectAtIndex:indexPath.row]];
	cell.d_lable.text =[NSString stringWithFormat:@"%@",[ detaildescription objectAtIndex:indexPath.row]];
		return cell;
	
}

-(IBAction)onselect:(id)sender{	
	NSIndexPath *idx =[NSIndexPath indexPathForRow:current_tag inSection:0];
	ranking_cell *cell1 = (ranking_cell *)[detailtable cellForRowAtIndexPath:idx];
	[cell1.optionBtn setTitle:currentstr forState:UIControlStateNormal];
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;
	cell1 =nil;
	idx =nil;
	
}
-(IBAction)onCancel:(id)sender{
	pvController.hidden =TRUE;
	pickertoolbar.hidden =TRUE;
	
}

-(IBAction)optionBtnClicked:(id)sender{
	UIButton *b =(UIButton*)sender;
	current_tag =b.tag;
	pvController.hidden =FALSE;
	pickertoolbar.hidden =FALSE;
	[pvController reloadAllComponents];
	b =nil;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    currentstr=    [dropdownarr objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [dropdownarr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [dropdownarr objectAtIndex:row];
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
	[dropdownarr release];
	[detailcaption release];
	[detailcaption release];
}


@end
