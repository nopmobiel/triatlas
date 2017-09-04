//
//  ViewController.h
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IASKAppSettingsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OverzichtsViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate, IASKSettingsDelegate>
{
    
        IASKAppSettingsViewController *appSettingsViewController;
    IBOutlet UIScrollView *overzichtsScroller;
    IBOutlet UIImageView *imgView;
	UIButton* AreaButtonList[600]; 
    UIBarButtonItem* nightButton;
    UIBarButtonItem* settingsButton;

    UISlider *brightnessSlider;

}


@property (nonatomic, retain) IBOutlet UIScrollView *overzichtsScroller;
@property (nonatomic, retain) IBOutlet UIImageView *imgView;
@property (nonatomic, retain) UISlider *brightnessSlider;
@property (nonatomic, retain) UIBarButtonItem *nightButton;
@property (nonatomic, retain) UIBarButtonItem *settingsButton;



- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender;

@end
