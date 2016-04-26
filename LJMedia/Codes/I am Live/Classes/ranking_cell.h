//
//  ranking_cell.h
//  I am Live
//
//  Created by Openxcelltech on 4/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ranking_cell : UITableViewCell {
	IBOutlet UILabel *t_lable;
	IBOutlet UILabel *d_lable;
	IBOutlet UIButton *optionBtn;

}
@property (nonatomic,retain)UILabel *t_lable;
@property (nonatomic,retain)UILabel *d_lable;
@property (nonatomic,retain)UIButton *optionBtn;

@end
