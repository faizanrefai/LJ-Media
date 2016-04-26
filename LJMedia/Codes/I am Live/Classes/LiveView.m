//
//  LiveView.m
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LiveView.h"
#import "DisplayMap.h"


@implementation LiveView


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	groupArr =[[NSArray alloc]initWithObjects:@"Family",@"Frands",@"Spare Time",@"Job",@"Temp",nil];
	[groupArr retain];
	radiousArr =[[NSArray alloc]initWithObjects:@"5000 Meters",@"4000 Meters",@"3000 Meters",@"2000 Meters",@"1000 Meters",@"500 Meters",nil];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[radiousArr retain];
}
-(void)viewWillAppear:(BOOL)animated{
	togglebutton.selected =FALSE;
	uparrow.selected =FALSE;
	camera_view.hidden =TRUE;
	self.navigationController.navigationBar.hidden =TRUE;
	dPicker.hidden =TRUE;
	dpickertoolbar.hidden =TRUE;
	
	[mp setMapType:MKMapTypeStandard];
	[mp setZoomEnabled:YES];
	[mp setScrollEnabled:YES];
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = 22.569722 ;
	region.center.longitude = 88.369722;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mp setRegion:region animated:YES]; 
	
	[mp setDelegate:self];
	
	// (0,357,320,100)
    
	DisplayMap *ann = [[DisplayMap alloc] init]; 
    
	ann.title = @" ";
	ann.subtitle = @" "; 
	ann.coordinate = region.center; 
	[mp addAnnotation:ann];
	
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{

    NSLog(@"Accelerate :: x = %f , y = %f , z = %f",acceleration.x,acceleration.y,acceleration.z);
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = nil;
	if(annotation != mp.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mp dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil )
            pinView = [[[MKPinAnnotationView alloc]
						initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
        
        UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[disclosureButton setFrame:CGRectMake(0, 0, 100, 30)];
		//[disclosureButton setImage:[UIImage imageNamed:@"HomeCell.jpg"] forState:UIControlStateNormal];
        [disclosureButton addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
        UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
        vw.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 50)];
        label.numberOfLines = 4;
        label.text = @"Mark";
        [vw addSubview:label];
        pinView.rightCalloutAccessoryView = vw;
        pinView.canShowCallout =FALSE;
		
		//pinView.leftCalloutAccessoryView = disclosureButton;
        pinView.selected =true;
        
		//pinView.pinColor = MKPinAnnotationColorPurple; 
        
		
		pinView.canShowCallout = YES;
		
		//pinView.animatesDrop = YES;
	} 
	else {
		[mp.userLocation setTitle:@"I am here"];
	}
	return pinView;
}

- (void)openAnnotation:(id)annotation;
{
    //mv is the mapView
    [mp selectAnnotation:annotation animated:YES];
    
}

-(IBAction)onBack:(id)sender{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)onDown:(id)sender{
	UIButton *btn =(UIButton*)sender;
	if(btn.selected){
		btn.selected =FALSE;
		topView.hidden =TRUE;
	}
	else {
		btn.selected =TRUE;
		topView.hidden =FALSE;
		[topView bringSubviewToFront:self.view];
	}

}
-(IBAction)onRadious:(id)sender{
	dPicker.tag =1;
	[dPicker reloadAllComponents];
	dPicker.hidden =FALSE;
	dpickertoolbar.hidden =FALSE;
	

}
-(IBAction)onGroup:(id)sender{
	
	dPicker.tag =2;
	[dPicker reloadAllComponents];
	dPicker.hidden =FALSE;
	dpickertoolbar.hidden =FALSE;
}
-(IBAction)onPost:(id)sender{
	if(objUser){
		objUser =nil;
		[objUser release];
	}
	objUser =[[Userinfo_map alloc] initWithNibName:@"Userinfo_map" bundle:nil];
	[self.navigationController pushViewController:objUser animated:YES];
}
-(IBAction)onLocate:(id)sender{
	[mp setMapType:MKMapTypeStandard];
	[mp setZoomEnabled:YES];
	[mp setScrollEnabled:YES];
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = 22.569722 ;
	region.center.longitude = 88.369722;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mp setRegion:region animated:YES]; 
	

}

-(IBAction)onselect:(id)sender{
	if(dPicker.tag ==1){
		radiousLabl.text =[currentstr retain];
	}
	else {
		groupLbl.text =[currentstr retain];
		
	}
	dPicker.hidden =TRUE;
	dpickertoolbar.hidden =TRUE;
}

-(IBAction)onCancel:(id)sender{
	

	dPicker.hidden =TRUE;
	dpickertoolbar.hidden =TRUE;
}

-(IBAction)ontogglebutton:(id)sender{
	UIButton *btn =(UIButton*)sender;
	if(btn.selected){
		btn.selected =FALSE;
		camera_view.hidden =TRUE;
		mp.hidden =FALSE;
	}
	else {
		btn.selected =TRUE;
		camera_view.hidden =FALSE;
		mp.hidden =TRUE;
	}

}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if(pickerView.tag ==1){
    currentstr=   [radiousArr objectAtIndex:row];
	}
	else {
		currentstr=    [groupArr objectAtIndex:row];
	}

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
	if(pickerView.tag ==1){
		return [radiousArr count];
	}
	else {
		return [groupArr count];
	}
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
   if(pickerView.tag ==1){
	return [radiousArr objectAtIndex:row];
   }
   else {
	  return [groupArr objectAtIndex:row];
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
