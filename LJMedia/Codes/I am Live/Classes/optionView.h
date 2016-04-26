//
//  optionView.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAQwebview.h"


@interface optionView : UIViewController {
	IBOutlet UITableView *userOption;
	FAQwebview *FAQObj;
	int valsection1;
	int valsection3;
	int valsection2;

}

@end
