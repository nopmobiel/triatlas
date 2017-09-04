//
//  ChapterViewController.m
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//
#define degreesToRadians(x) (M_PI * (x) / 180.0)
#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]


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
@synthesize nightButton;
@synthesize flipButton;
@synthesize homeButton;
@synthesize btnFOV;
@synthesize mirrorButton;



- (UIColor*) nightColor {
    
    CGFloat nRed=120.0/255.0;
    CGFloat nGreen=0/255.0;
    CGFloat nBlue=0/255.0;
    return [[UIColor alloc]initWithRed:nRed green:nGreen blue:nBlue alpha:1.0];
    
}

- (UIColor*) lightnightColor {
    
    CGFloat nRed=130.0/255.0;
    CGFloat nGreen=0/255.0;
    CGFloat nBlue=0/255.0;
    return [[UIColor alloc]initWithRed:nRed green:nGreen blue:nBlue alpha:1.0];
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


// Versie 1.1
/*
- (NSString *) timestamp 
{
    NSDateFormatter *date_formatter=[[NSDateFormatter alloc]init];
    [date_formatter setDateFormat:@"YYMMdd_HH_mm_ss"];
    NSString* strDate = [date_formatter stringFromDate:[NSDate date]];
        return strDate;
    
}


// VOICE
- (void) startRecording{

    audioRecorder = nil;

    
     NSArray *dirPaths;
   NSString *docsDir;
NSString *timestamp = [self timestamp];

   dirPaths = NSSearchPathForDirectoriesInDomains(
        NSDocumentDirectory, NSUserDomainMask, YES);
   docsDir = [dirPaths objectAtIndex:0];
   NSString *soundFilePath = [docsDir
       stringByAppendingPathComponent:[NSString stringWithFormat:@"triatlas%@.aac", timestamp]];


   NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];



NSLog(@"Docsdir %@", soundFilePath);

NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithInt:kAudioFormatMPEG4AAC], AVFormatIDKey,
                                  [NSNumber numberWithInt:AVAudioQualityMin], AVEncoderAudioQualityKey,
                                  [NSNumber numberWithInt:16], AVEncoderBitRateKey,
                                  [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                  [NSNumber numberWithFloat:8000.0], AVSampleRateKey,
                                  [NSNumber numberWithInt:8], AVLinearPCMBitDepthKey,
                                  nil];




  NSError *error = nil;

  audioRecorder = [[AVAudioRecorder alloc]
                  initWithURL:soundFileURL
                  settings:recordSettings
                  error:&error];




if ([audioRecorder prepareToRecord] == YES){
    [audioRecorder recordForDuration:20 ];
}else {
    int errorCode = CFSwapInt32HostToBig ([error code]); 
    NSLog(@"Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode); 

}

self.title=@"Recording...";



UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop recording" style:UIBarButtonItemStyleBordered  target:self action:@selector(stopRecording)];
self.navigationItem.rightBarButtonItem = stopButton;
}



- (void) stopRecording{

UIBarButtonItem *startButton = [[UIBarButtonItem alloc] initWithTitle:@"Record memo" style:UIBarButtonItemStyleBordered  target:self action:@selector(startRecording)];
self.navigationItem.rightBarButtonItem = startButton;

    if (audioRecorder.recording)
    {
            [audioRecorder stop];
    } else if (audioPlayer.playing) {
            [audioPlayer stop];
            
    }
  NSString *titel=[NSString stringWithFormat:@"Chart %d",itemTag];
    self.navigationItem.title=titel;
    
    

}




*/



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
    [brightnessSlider setMinimumValue:0.1];
    [brightnessSlider setMaximumValue:1];
  
    
    [brightnessSlider addTarget:self
               action:@selector(sliderValueChanged:) 
     forControlEvents:UIControlEventValueChanged];

    
    NSString *titel=[NSString stringWithFormat:@"Chart %d",itemTag];
    self.navigationItem.title=titel;
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        detailScroller.zoomScale=0.3;
    } else {
        detailScroller.zoomScale=0.8;
    }
    
    
    
  

    
    
    // Toolbar buttons
    
    
     // Custom homebutton 
      homeButton = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageNamed:@"09-arrow-west.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
    

    [brightnessSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [brightnessSlider setMinimumTrackImage:[[UIImage imageNamed:@"redslider2.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [brightnessSlider setMaximumTrackImage:[[UIImage imageNamed:@"redslider2.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [brightnessSlider setThumbTintColor:[UIColor darkGrayColor]];
    
   nightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"84-lightbulb.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(night_clicked:)];
    
    UIBarButtonItem *sliderAsToolbarItem = [[UIBarButtonItem alloc] initWithCustomView:brightnessSlider ];
    [sliderAsToolbarItem setWidth:100.0];
    
  flipButton = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageNamed:@"01-refresh.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(flip_clicked:)];

  mirrorButton = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"14-bothways.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(mirror_clicked:)];
    

      

    [self setToolbarItems:[NSArray arrayWithObjects:homeButton, nightButton, sliderAsToolbarItem,  flipButton, mirrorButton, nil]];

// Memo versie 1.1
/*
     UIBarButtonItem *startButton = [[UIBarButtonItem alloc] initWithTitle:@"Record Memo" style:UIBarButtonItemStyleBordered  target:self action:@selector(startRecording)];
    self.navigationItem.rightBarButtonItem = startButton;
*/
    
    
    // Navigatiebuttons (1-2)
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,104,50,37) withTag:1]; // 
    [self addAreaButtonToMapAtPoint:CGRectMake( 798,104,50,37) withTag:2];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1520,104,50,37) withTag:3];
    
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,1148,50,37) withTag:4];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1520,1148,50,37) withTag:5];
    
    [self addAreaButtonToMapAtPoint:CGRectMake( 80,2192,50,37) withTag:6];
    [self addAreaButtonToMapAtPoint:CGRectMake( 798,2192,50,37) withTag:7];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1523,2192,50,37) withTag:8];



    // Inlezen Kaartarray.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"KaartIndex" ofType:@"plist"];
    kaartArray = [NSArray arrayWithContentsOfFile:plistPath];



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


- (void)viewWillAppear:(BOOL)animated {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   float brightness=[defaults floatForKey:@"brightness"];
       [self.navigationController setNavigationBarHidden:TRUE animated:NO];


    self.view.alpha=brightness;
    brightnessSlider.value=brightness;

// Versie 1.1
/*
   [self addFinderCircleButton];
	BOOL enabled = [defaults boolForKey:@"isCircleVisible"];
  	if (enabled) { 	
		btnFOV.hidden=FALSE;
	} else
    btnFOV.hidden=TRUE;
    
    */
    
   self.navigationController.toolbar.alpha=brightness;
   
    BOOL isNight = [defaults boolForKey:@"isNight"];
    if (isNight) [self makeNight];
   

}

- (void)toggleNavBar:(UITapGestureRecognizer *)gesture {
    BOOL barsHidden = self.navigationController.toolbar.hidden;
    [self.navigationController setToolbarHidden:!barsHidden];
}

- (IBAction)flip_clicked:(id)sender {
    imgView.image=rotateUIImage(imgView.image, 180);
    
}

-(IBAction)mirror_clicked:(id)sender {
    	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if (!isMirrored) {
    UIImage * flippedImage = [UIImage imageWithCGImage:imgView.image.CGImage scale:imgView.image.scale orientation:UIImageOrientationUpMirrored];
    imgView.image = flippedImage;
        isMirrored=TRUE;
    }
    else {
    
        NSString *strImageName=@"";
        strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
        imgView.image=	[UIImage imageNamed:strImageName];
         BOOL isNight = [defaults boolForKey:@"isNight"];
        if (isNight) [self makeNight];
        
        
        isMirrored=FALSE;
    }
    
 
}

    
- (IBAction) sliderValueChanged:(UISlider *)sender {  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.view.alpha=sender.value;
    self.navigationController.toolbar.alpha=sender.value;
    self.navigationController.navigationBar.alpha=sender.value;
    
    [defaults setFloat:sender.value forKey:@"brightness"];
    [defaults synchronize];
    
}
    

    
-(void)addAreaButtonToMapAtPoint:(CGRect)rect withTag:(NSInteger)areatag{
    UIButton *AreaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    AreaButton.frame = rect;
    [AreaButton addTarget:self action:@selector(gotoArea:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:AreaButton];
    [AreaButton setTag:areatag];
 	AreaButtonList[areatag] = AreaButton;
}

// Custom back
- (IBAction)goBack :(id)sender {
// Teruggaan naar overzichtsview, maar wel met het juiste startpunt.
    [self.navigationController popViewControllerAnimated:YES];
   }
    
    
    


// Versie 1.1
/*
-(void) addFinderCircleButton {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *FOVstring = [defaults stringForKey:@"FOVDegrees"];
    float FOV=[FOVstring floatValue];
    if(FOV>10) FOV=1;
    if(FOV<1) FOV=1;
    // 1 graad =183 pix
    FOV=183*FOV;
    btnFOV = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFOV.frame = CGRectMake(135.0, 180.0, FOV * detailScroller.zoomScale, FOV *detailScroller.zoomScale);//width and height should be same value
    btnFOV.center=self.view.center;
    btnFOV.userInteractionEnabled=FALSE;
    btnFOV.clipsToBounds = YES;
    btnFOV.layer.cornerRadius = FOV * detailScroller.zoomScale /2;
    btnFOV.layer.borderColor=[UIColor redColor].CGColor;
    btnFOV.layer.borderWidth=1.0f;
    [self.view addSubview:btnFOV];

}


*/

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
  // Versie 1.1
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *FOVstring = [defaults stringForKey:@"FOVDegrees"];
    float FOV=[FOVstring floatValue];
    FOV=183*FOV;
        
    btnFOV.frame = CGRectMake(135.0, 180.0,  FOV * detailScroller.zoomScale, FOV * detailScroller.zoomScale);//width and height should be same value
    btnFOV.layer.cornerRadius = FOV * detailScroller.zoomScale /2;//half of the width
    btnFOV.center=self.view.center;


}


-(IBAction)gotoArea:(id)sender {

    NSString *strImageName;
    UIImage *overzichtsimage;
   // Kaartarray Kaartnummer boven:  123 midden 45 onder: 678
    switch ([sender tag]) {
        case 1:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:0] intValue];
            break;
        case 2:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:1] intValue];
            break;
        case 3:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:2] intValue];
            break;
        case 4:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:3] intValue];
            break;
        case 5:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:4] intValue];
            break;
        case 6:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:5] intValue];
            break;
        case 7:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:6] intValue];
            break;
        case 8:
            itemTag = [[[kaartArray objectAtIndex:itemTag-1] objectAtIndex:7] intValue];
            break;

            
        default:
            break;
    }
    
    strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
    overzichtsimage=	[UIImage imageNamed:strImageName];
    imgView.image=overzichtsimage;
    self.title=[NSString stringWithFormat:@"Chart %d",itemTag];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isNight = [defaults boolForKey:@"isNight"];
    BOOL isInverted = [defaults boolForKey:@"isInverted"];

    if (isNight) [self makeNight];
    if (isInverted) [self invert];
    
}


-(IBAction)night_clicked:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isNight = [defaults boolForKey:@"isNight"];
    
    if (isNight) {
        
        [self makeDay];
    }
    else {
        
        
        [self makeNight];
    }
}


-(void) makeNight {



    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];
    float brightness = [defaults floatForKey:@"brightness"];
    imgView.image=	[UIImage imageNamed:strImageName];
    [self invert];
    UIGraphicsBeginImageContext(imgView.image.size);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [imgView.image drawInRect:CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height)];
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeMultiply);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),[self nightColor].CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, imgView.image.size.width, imgView.image.size.height));
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    brightnessSlider.alpha=0.5;
    self.navigationController.toolbar.alpha = brightness;
    self.navigationController.navigationBar.alpha=brightness;
    btnFOV.alpha=brightness;
    imgView.image=returnImage;
    brightnessSlider.value=brightness;
    [self setTitle:@""];
    
    homeButton.tintColor=[self lightnightColor];
    nightButton.tintColor=[self lightnightColor];
    flipButton.tintColor=[self lightnightColor];
    mirrorButton.tintColor=[self lightnightColor];
    
    [defaults setBool:TRUE forKey:@"isNight"];
    [defaults synchronize];
}


-(void) makeDay {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    brightnessSlider.alpha=1.0;
    self.navigationController.toolbar.alpha = 1.0;
    self.navigationController.navigationBar.alpha=1.0;
    NSString *strImageName=@"";
    strImageName=[NSString stringWithFormat:@"%d.jpeg",itemTag];

    NSString *strTitel=[NSString stringWithFormat:@"%d",itemTag];
    imgView.image=	[UIImage imageNamed:strImageName];
    BOOL invertenabled = [defaults boolForKey:@"isInverted"];
    btnFOV.alpha=1.0;
  	if (invertenabled)	[self invert];
    [defaults setBool:FALSE forKey:@"isNight"];
    self.title=strTitel;
    nightButton.tintColor=[UIColor whiteColor];
    flipButton.tintColor=[UIColor whiteColor];
    mirrorButton.tintColor=[UIColor whiteColor];
    homeButton.tintColor=[UIColor whiteColor];

    

    [defaults synchronize];
}

// 1.1


-(void) invert {
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
 
    

    
- (void)viewDidUnload
{
    [super viewDidUnload];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return YES;
}


@end
