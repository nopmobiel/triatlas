//
//  AppDelegate.h
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OverzichtsViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) OverzichtsViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;




@end


