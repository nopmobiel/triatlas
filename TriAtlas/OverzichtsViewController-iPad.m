//
//  OverzichtsViewController-iPad.m
//  skymap
//
//  Created by Norbert Schmidt on 11-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import "OverzichtsViewController-iPad.h"

@interface OverzichtsViewController_iPad ()

@end

@implementation OverzichtsViewController_iPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
