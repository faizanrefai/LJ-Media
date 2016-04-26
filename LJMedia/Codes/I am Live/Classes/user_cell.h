//
//  user_cell.h
//  I am Live
//
//  Created by Openxcelltech on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface user_cell : UITableViewCell {
	UILabel *titleLbl;
	UISwitch *statusSwitch;
}

@property (nonatomic,retain)IBOutlet UILabel *titleLbl;
@property (nonatomic,retain)IBOutlet UISwitch *statusSwitch;
@end
