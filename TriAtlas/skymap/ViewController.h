//
//  ViewController.h
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *overzichtsScroller;
    IBOutlet UIImageView *mainImage;
	UIButton* AreaButtonList[600]; 
}


@property (nonatomic, retain) IBOutlet UIScrollView *overzichtsScroller;
@property (nonatomic, retain) IBOutlet UIImageView *mainImage;






@end
