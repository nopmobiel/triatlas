//
//  ViewController.m
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import "ViewController.h"
#import "ChapterViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize overzichtsScroller,mainImage;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	UIImage *overzichtsimage=	[UIImage imageNamed:@"index.png"];
    int imgwidth=overzichtsimage.size.width;
    int imgheight=overzichtsimage.size.height;
    
    overzichtsScroller.delegate=self;
    
    [[self overzichtsScroller] setContentSize:CGSizeMake(imgwidth, imgheight)];
	[[self overzichtsScroller] setAutoresizesSubviews:YES];
	[[self overzichtsScroller] setMaximumZoomScale:1.0f]; 
	[[self overzichtsScroller] setMinimumZoomScale:0.24f];
    
	[self setMainImage:[[UIImageView alloc] init] ] ;
	[[self mainImage] setFrame:CGRectMake(0,0, imgwidth, imgheight)];
	[[self mainImage] setImage:overzichtsimage];
	[[self mainImage] setUserInteractionEnabled:YES];
    [[self overzichtsScroller] addSubview:mainImage];
    
    
    
    
    /// AREADEFINITIES ///
    
    CGRect zoomRect = CGRectMake(imgwidth/2,imgheight/2,1,1);
    [overzichtsScroller scrollRectToVisible:zoomRect animated:NO];
    // Area 1 
    [self addAreaButtonToMapAtPoint:CGRectMake(791,196,173,50) withTag:1];
    // Area 2 
    [self addAreaButtonToMapAtPoint:CGRectMake(961,199,170,46) withTag:2];
    // Area 3 
    [self addAreaButtonToMapAtPoint:CGRectMake(1129,199,168,50) withTag:3];
    // Area 4 
    [self addAreaButtonToMapAtPoint:CGRectMake(1292,199,163,53) withTag:4];
    // Area 5 
    [self addAreaButtonToMapAtPoint:CGRectMake(1462,199,173,53) withTag:5];
    // Area 6 
    [self addAreaButtonToMapAtPoint:CGRectMake(1630,199,93,53) withTag:6];
    
    [self addAreaButtonToMapAtPoint:CGRectMake(38,199,87,43) withTag:6];
    // Area 7 
    [self addAreaButtonToMapAtPoint:CGRectMake(125,199,163,53) withTag:7];
    
    // Area 8 
    [self addAreaButtonToMapAtPoint:CGRectMake(298,199,164,48) withTag:8];
    // Area 9 
    [self addAreaButtonToMapAtPoint:CGRectMake(459,199,163,53) withTag:9];
    // Area 10 
    [self addAreaButtonToMapAtPoint:CGRectMake(626,199,163,53) withTag:10];
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)sv{
    return mainImage;
}



// Areabutton toevoegen
-(void)addAreaButtonToMapAtPoint:(CGRect)rect withTag:(NSInteger)areatag{
    UIButton *AreaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AreaButton.frame = rect;
    [AreaButton addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
    [mainImage addSubview:AreaButton];
    [AreaButton setTag:areatag];
    [AreaButton setAlpha:0.5];
 	AreaButtonList[areatag] = AreaButton; 	
}



- (void) viewWillAppear:(BOOL)animated {
    
    [self navigationController].navigationBarHidden = TRUE;
    [self.navigationController setToolbarHidden:YES animated:NO];

}

// Screoll handling

-(void)scrollViewDidZoom:(UIScrollView *)sv{

}


// Zoomen naar zone 
-(void)showDetail:(id)sender{
    

    ChapterViewController *mvc=[[ChapterViewController alloc]initWithNibName:@"ChapterViewController"   bundle:nil] ; 
    mvc.itemTag=[sender tag];
    [self.navigationController pushViewController:mvc  animated: NO];   

    
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
