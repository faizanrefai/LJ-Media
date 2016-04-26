//
//  optionView.m
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "optionView.h"


@implementation optionView


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Options";	
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(onHome:)];
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terms & Conditions" message:@"I Am Live Application will use your current location and share with other application user."  delegate:self cancelButtonTitle:@"Accept" otherButtonTitles: @"Decline", nil];
	[alert show];
	[alert release];
	
	valsection1 = 0;
	valsection2 = 0;
	valsection3 = 0;
}


-(IBAction)onHome:(id)sender{
	[self.navigationController popToRootViewControllerAnimated:YES];
	
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	
	if(section == 0){
		return @"GPS options";
		
	}
	else if(section == 1){
		return @"Privacy settings";
	}
	else if(section == 2){
		return @"24h route is shown to group";
	}
	else {
		return @"Other links";
	}

	
	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 0)
		return 3;
	else if(section == 1){
			return 3;
	}
	else if(section == 2){
		return 2;
	}

	else 
		return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if(indexPath.section == 0){
		if(indexPath.row == 0)cell.textLabel.text =@"Auto";
		if(indexPath.row == 1)cell.textLabel.text =@"Height Accuracy";
		if(indexPath.row == 2)cell.textLabel.text =@"Battery Saver";
		cell.accessoryType =UITableViewCellAccessoryNone;
		if(indexPath.row == valsection1){
			cell.accessoryType =UITableViewCellAccessoryCheckmark;
		}
	
	}
	else if(indexPath.section == 1){
		if(indexPath.row == 0)cell.textLabel.text =@"High(Standard)";
		if(indexPath.row == 1)cell.textLabel.text =@"Medium";
		if(indexPath.row == 2)cell.textLabel.text =@"Low";
		cell.accessoryType =UITableViewCellAccessoryNone;
		if(indexPath.row == valsection2){
			cell.accessoryType =UITableViewCellAccessoryCheckmark;
		}		
	}
	else if(indexPath.section == 2){
		if(indexPath.row == 0)cell.textLabel.text =@"Yes";
		if(indexPath.row == 1)cell.textLabel.text =@"No";
		cell.accessoryType =UITableViewCellAccessoryNone;
		if(indexPath.row == valsection3){
			cell.accessoryType =UITableViewCellAccessoryCheckmark;
		}	
	}
	else {
		cell.accessoryType =UITableViewCellAccessoryNone;
		if(indexPath.row == 0)cell.textLabel.text =@"FAQ";
		if(indexPath.row == 1)cell.textLabel.text =@"Tearms of use";
		if(indexPath.row == 2)cell.textLabel.text =@"Contact us";
	}

    
    return cell;
}





#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
		valsection1 =indexPath.row;
		[userOption reloadData];
	}
	else if(indexPath.section == 1){
		valsection2 =indexPath.row;
		[userOption reloadData];
	}
	else if(indexPath.section == 2){
		valsection3 =indexPath.row;
		[userOption reloadData];
	}
	else {
		if(FAQObj){
			FAQObj =nil;
			[FAQObj release];
		}
		FAQObj = [[FAQwebview alloc] initWithNibName:@"FAQwebview" bundle:nil];	
		if(indexPath.row == 0)FAQObj.titleStr =@"FAQ";
		if(indexPath.row == 1)FAQObj.titleStr =@"Tearms of use";
		if(indexPath.row == 2)FAQObj.titleStr =@"Contact us";
		[self.navigationController pushViewController:FAQObj animated:YES];
	}

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
