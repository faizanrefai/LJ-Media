//
//  UserProfileView.m
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UserProfileView.h"
#import "user_cell.h"


@implementation UserProfileView


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	socialmediaList =[NSArray arrayWithObjects:@"Facebook",@"Twitter",@"Google+",@"LinkedIn",@"Myspace",@"FourSqure",nil];
	grouplist=[NSArray arrayWithObjects:@"Family",@"Friends",@"Spare Time",@"Job",@"tempo",nil];
	[socialmediaList retain];
	[grouplist retain];
	self.title = @"Mark Profile";	
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(onHome:)];
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];

}


-(IBAction)onHome:(id)sender{
	[self.navigationController popToRootViewControllerAnimated:YES];

}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

	if(section == 0){
	return @"Profile List";
	
	}
	else {
		return @"Group List";
	}


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 1)
		return [grouplist count];
	else 
		return[socialmediaList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    user_cell *cell = (user_cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"user_cell" owner:nil options:nil];
		cell = [nib objectAtIndex:0];			
    }
    
	if(indexPath.section ==0){
		cell.titleLbl.text =[socialmediaList objectAtIndex:indexPath.row];
	}
	else {
		cell.titleLbl.text =[grouplist objectAtIndex:indexPath.row];
	}

      
    return cell;
}





#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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
