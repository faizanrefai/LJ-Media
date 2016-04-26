//
//  FAQwebview.h
//  I am Live
//
//  Created by Openxcelltech on 4/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FAQwebview : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *faqweb;
	NSString *titleStr;
	IBOutlet UIActivityIndicatorView *activity;

}

@property(nonatomic,retain)NSString *titleStr;
@end
