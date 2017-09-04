//
//  ChapterViewController.m
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//
#define degreesToRadians(x) (M_PI * (x) / 180.0)
#import "ChapterViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController


@synthesize imgView;
@synthesize detailScroller;
@synthesize itemTag;
@synthesize brightnessSlider;
@synthesize isMirrored;
@synthesize kaartArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }
    return YES;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    

    NSString *strImageName=@"";
    strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
	UIImage *overzichtsimage=	[UIImage imageNamed:strImageName];
    
    int imgwidth=overzichtsimage.size.width;
    int imgheight=overzichtsimage.size.height;
    
    detailScroller.delegate=self;
        [[self detailScroller] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [[self detailScroller] setContentSize:CGSizeMake(imgwidth, imgheight)];
	[[self detailScroller] setAutoresizesSubviews:YES];
	[[self detailScroller] setMaximumZoomScale:1.4f]; 
	[[self detailScroller] setMinimumZoomScale:0.2f];
    self.detailScroller.autoresizingMask=UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;

    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavBar:)];
    
    [self.view addGestureRecognizer:gesture];
    gesture.delegate=self;

    
	[self setImgView:[[UIImageView alloc] init] ] ;
    
	[[self imgView] setFrame:CGRectMake(0,0, imgwidth, imgheight)];
	[[self imgView] setImage:overzichtsimage];
	[[self imgView] setUserInteractionEnabled:YES];
     
    [[self detailScroller] addSubview:imgView];
    CGRect zoomRect = CGRectMake(imgwidth/2,imgheight/2,1,1);
    [detailScroller scrollRectToVisible:zoomRect animated:NO];
    
	brightnessSlider = [[UISlider alloc] init];
    brightnessSlider.continuous = YES;
    // truc om van alpha 1 naar 0 te gaan.
  //  brightnessSlider.transform = CGAffineTransformRotate(brightnessSlider.transform, 180.0/180*M_PI);
    [brightnessSlider setMinimumValue:0.1];
    [brightnessSlider setMaximumValue:1];
    brightnessSlider.value=1;
    [brightnessSlider addTarget:self
               action:@selector(sliderValueChanged:) 
     forControlEvents:UIControlEventValueChanged];

    
    
    NSString *titel=[NSString stringWithFormat:@"Chart %d",itemTag];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 0, 320, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = titel;
    [self.navigationItem setTitleView:titleLabel];
    
    
    
     // Toolbar buttons

    
    
    
    // Toolbar buttons
    
    brightnessSlider = [[UISlider alloc] init];
    brightnessSlider.continuous = YES;
    // truc om van alpha 1 naar 0 te gaan.
    //    brightnessSlider.transform = CGAffineTransformRotate(brightnessSlider.transform, 180.0/180*M_PI);
    [brightnessSlider setMinimumValue:0.1];
    [brightnessSlider setMaximumValue:1];
    brightnessSlider.value=1;
    [brightnessSlider addTarget:self
                         action:@selector(sliderValueChanged:) 
               forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nightButton = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Night" style:UIBarButtonItemStyleBordered target:self action:@selector(night_clicked:)];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"F" style:UIBarButtonItemStyleBordered target:self action:@selector(flip_clicked:)];

    
  //  UIBarButtonItem *nightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"84-lightbulb.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(night_clicked:)];
    
    //  UIBarButtonItem *flipButton =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"01-refresh.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(flip_clicked:)];
    
    //  UIBarButtonItem *mirrorButton = [[UIBarButtonItem alloc]
    //                                  initWithTitle:@"M" style:UIBarButtonItemStyleBordered target:self action:@selector(mirror_clicked:)];
    
//    UIBarButtonItem *invertButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"62-contrast.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(invert_clicked:)];
    
    
    UIBarButtonItem *sliderAsToolbarItem = [[UIBarButtonItem alloc] initWithCustomView:brightnessSlider ];
    // Set the width of aSlider
    [sliderAsToolbarItem setWidth:100.0];
    
    [self setToolbarItems:[NSArray arrayWithObjects:nightButton, sliderAsToolbarItem, flipButton,  nil]];
    
    
    
    
        /* 
     UIBarButtonItem *mirrorButton = [[UIBarButtonItem alloc]
     initWithTitle:@"M" style:UIBarButtonItemStyleBordered target:self action:@selector(mirror_clicked:)];
     
     UIBarButtonItem *invertButton = [[UIBarButtonItem alloc]
     initWithTitle:@"Inv" style:UIBarButtonItemStyleBordered target:self action:@selector(invert_clicked:)];
     
     UIBarButtonItem *sliderAsToolbarItem = [[UIBarButtonItem alloc] initWithCustomView:brightnessSlider ];
     // Set the width of aSlider
     [sliderAsToolbarItem setWidth:100.0];
     
     [self setToolbarItems:[NSArray arrayWithObjects:nightButton, sliderAsToolbarItem, invertButton, flipButton, mirrorButton, nil]];
     */
     
    [self.navigationController setToolbarHidden:FALSE];
    CGFloat nRed=84.0/255.0;
    CGFloat nGreen=0/255.0;
    CGFloat nBlue=0/255.0;
    UIColor *nightColor=[[UIColor alloc]initWithRed:nRed green:nGreen blue:nBlue alpha:0.8];
    self.navigationController.toolbar.tintColor=nightColor;

    
    // Navigatiebuttons (1-2
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,104,50,37) withTag:1]; // 
    [self addAreaButtonToMapAtPoint:CGRectMake( 798,104,50,37) withTag:2];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1520,104,50,37) withTag:3];
    
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,1148,50,37) withTag:4];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1520,1148,50,37) withTag:5];
    
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,2192,50,37) withTag:6];
    [self addAreaButtonToMapAtPoint:CGRectMake( 798,2192,50,37) withTag:7];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1523,2192,50,37) withTag:8];

    // Kaartarray Kaartnummer  123 678 , RA Start Ra end Dec Start, Dec End
    kaartArray = [NSArray arrayWithObjects:
                        [NSArray arrayWithObjects:@"1", @"1", @"1", @"28" , @"11", @"12", @"22.48" , @"25.12" ,  @"79.25", @"90.00",nil],
                        [NSArray arrayWithObjects:@"item 2-1", @"item 2-2", nil],
                        [NSArray arrayWithObjects:@"item 3-1", @"item 3-2", nil],
                        [NSArray arrayWithObjects:@"item 4-1", @"item 4-2", nil],
                        nil];

    
    
    
    
    
    detailScroller.zoomScale=0.5;
    
    
}




UIImage* rotateUIImage(const UIImage* src, float angleDegrees)  {   
    UIView* rotatedViewBox = [[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, src.size.width, src.size.height)];
    float angleRadians = angleDegrees * ((float)M_PI / 180.0f);
    CGAffineTransform t = CGAffineTransformMakeRotation(angleRadians);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, angleRadians);
    
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-src.size.width / 2, -src.size.height / 2, src.size.width, src.size.height), [src CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)sv{
    return imgView;
}

-(void)scrollViewDidZoom:(UIScrollView *)sv{
    
}
- (void)viewWillAppear:(BOOL)animated {

    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    if (appDelegate.isNight) { [self makeNight];}
    if (!appDelegate.isNight) { [self makeDay];}
    isMirrored=FALSE;
    self.view.alpha=appDelegate.brightness;
    
    brightnessSlider.value=appDelegate.brightness;
    self.navigationController.toolbar.alpha=appDelegate.brightness;
    self.navigationController.navigationBar.alpha=appDelegate.brightness;
    
    
    
    
}

- (void)toggleNavBar:(UITapGestureRecognizer *)gesture {
    BOOL barsHidden = self.navigationController.navigationBar.hidden;
    [self.navigationController setNavigationBarHidden:!barsHidden animated:NO];
    [self.navigationController setToolbarHidden:!barsHidden];
}

- (IBAction)flip_clicked:(id)sender {
    
    imgView.image=rotateUIImage(imgView.image, 180);

    
    
}

-(IBAction)mirror_clicked:(id)sender {
    
    if (!isMirrored) {
    UIImage * flippedImage = [UIImage imageWithCGImage:imgView.image.CGImage scale:imgView.image.scale orientation:UIImageOrientationUpMirrored];
    imgView.image = flippedImage;
        isMirrored=TRUE;
    }
    else {
        NSString *strImageName=@"";
        strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
        imgView.image=	[UIImage imageNamed:strImageName];
        isMirrored=FALSE;
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

        if (appDelegate.isNight) {
            [self makeNight];
        }
        
        
        
    }
    
 
}




// DEBUG

- (void)scrollViewDidEndZooming:(UIScrollView *)sv withView:(UIView *)view atScale:(float)scale{
  //  NSLog(@"Zoomscale %f",scale);
}


    
- (IBAction) sliderValueChanged:(UISlider *)sender {  
    self.view.alpha=sender.value;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.brightness=sender.value;
    
        self.navigationController.toolbar.alpha=sender.value;
        self.navigationController.navigationBar.alpha=sender.value;
    }  
    

    
// Areabutton toevoegen
-(void)addAreaButtonToMapAtPoint:(CGRect)rect withTag:(NSInteger)areatag{
    UIButton *AreaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    AreaButton.frame = rect;
    [AreaButton addTarget:self action:@selector(gotoArea:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:AreaButton];
    [AreaButton setTag:areatag];
    [AreaButton setAlpha:0.5];
 	AreaButtonList[areatag] = AreaButton;
 	
}

-(IBAction)gotoArea:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    NSString *strImageName;
    UIImage *overzichtsimage;

    switch ([sender tag]) {
        case 1:
            // Linksboven
            break;
        case 2:
            // Midden boven
            break;
        case 3:
            // Rechtsboven
                break;

        
        case 4:
            // Links
            itemTag--;
            strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
            overzichtsimage=	[UIImage imageNamed:strImageName];
            imgView.image=overzichtsimage;
            self.navigationItem.title=[NSString stringWithFormat:@"Chart %d",itemTag];        
            if (appDelegate.isNight) {
                [self makeNight];
            }
            
            
            break;
        case 5:
            // Rechts
            itemTag++;

            
            strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
            overzichtsimage=	[UIImage imageNamed:strImageName];
            imgView.image=overzichtsimage;
            self.navigationItem.title=[NSString stringWithFormat:@"Chart %d",itemTag];            
            if (appDelegate.isNight) {
                [self makeNight];
            }
            
            break;
            
            
            
        case 6:
            // 
            break;
        case 7:
            // 
            break;
        case 8:
            // 
            break;

            
            
            
            
            
        default:
            break;
    }
    
}








-(IBAction)night_clicked:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.isNight) {
        [self makeDay];
    } 
    else {
        [self makeNight];
    }
}
    

-(void) makeNight {
    CGFloat nRed=84.0/255.0;
    CGFloat nGreen=0/255.0;
    CGFloat nBlue=0/255.0;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIColor *nightColor=[[UIColor alloc]initWithRed:nRed green:nGreen blue:nBlue alpha:0.8];
        [self invert_clicked:nil];
        UIGraphicsBeginImageContext(imgView.image.size);
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
        [imgView.image drawInRect:CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height)];
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeMultiply);
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),nightColor.CGColor);
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height));
        UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        brightnessSlider.alpha=0.5;
        self.navigationController.toolbar.alpha = 0.3;
        self.navigationController.navigationBar.alpha=0.2;
              imgView.image=returnImage;
/*        UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        lbl.textAlignment=UITextAlignmentCenter;
        lbl.backgroundColor=[UIColor clearColor];
        lbl.textColor=nightColor;
        self.navigationController.navigationItem.titleView=lbl;
 */
        appDelegate.isNight=TRUE;

    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 0, 320, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = [NSString stringWithFormat:@"Chart %d",itemTag];   
    [self.navigationItem setTitleView:titleLabel];
    
    
}

-(void) makeDay {
    [self invert_clicked:nil];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    brightnessSlider.alpha=1.0;
    self.navigationController.toolbar.alpha = 1.0;
    self.navigationController.navigationBar.alpha=1.0;
    
    NSString *strImageName=@"";
    strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
    imgView.image=	[UIImage imageNamed:strImageName];
    appDelegate.isNight=FALSE; 
}



-(IBAction) invert_clicked:(id)sender {
    
    UIGraphicsBeginImageContext(imgView.image.size);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [imgView.image drawInRect:CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height)];
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeDifference);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),[UIColor whiteColor].CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height));
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imgView.image=returnImage;
    
}

-(void)setLandscapeView{
  /*  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        CGRect rectangle = CGRectMake(0, 0, 1024, 665);
        detailScroller.frame=rectangle;}
    else {
        CGRect rectangle = CGRectMake(0, 0, 1024, 768);
        detailScroller.frame=rectangle;
    }
   */ 
   }
    
    

    



-(void)setPortraitView{
/*    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        CGRect rectangle = CGRectMake(0, 0, 768, 469);
        detailScroller.frame=rectangle;}
    else {
        CGRect rectangle = CGRectMake(0, 0, 768, 1024);
        detailScroller.frame=rectangle;
    }
 */
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

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
    [self setLandscapeView];
    
}else { 
    [self setPortraitView];
    
    
}

}




@end
