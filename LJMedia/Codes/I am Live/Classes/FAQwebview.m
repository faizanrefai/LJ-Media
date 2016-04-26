//
//  FAQwebview.m
//  I am Live
//
//  Created by Openxcelltech on 4/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FAQwebview.h"

@implementation FAQwebview
@synthesize titleStr;

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title =titleStr; 
	activity.hidesWhenStopped =TRUE;
	[faqweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	[activity startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[activity stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
	[activity stopAnimating];	
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
