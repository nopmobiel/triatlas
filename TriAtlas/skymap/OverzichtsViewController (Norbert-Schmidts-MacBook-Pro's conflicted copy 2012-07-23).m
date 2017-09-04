//
//  ViewController.m
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//
#import "AppDelegate.h"
#import "OverzichtsViewController.h"
#import "ChapterViewController.h"
@interface OverzichtsViewController ()

@end

@implementation OverzichtsViewController
@synthesize overzichtsScroller,imgView;
@synthesize actionButton, actionSheet;
@synthesize brightnessSlider;


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }
    return YES;
}

- (void)viewDidLoad
{
    
    
    
    
   
    
    
    
    
    [super viewDidLoad];
	
    /*


    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor darkGrayColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Overview", @"");
      [label sizeToFit];
    */
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
	UIImage *overzichtsimage=	[UIImage imageNamed:@"index.png"];
    int imgwidth=overzichtsimage.size.width;
    int imgheight=overzichtsimage.size.height;
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
   // NSLog(@"width %d", imgheight);
    // infobutton
//    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
 //   [infoButton addTarget:self action:@selector(buttoninfoclick:) forControlEvents:UIControlEventTouchUpInside]; 
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton] ;

    
    // Tint
    CGFloat nRed=84.0/255.0;
    CGFloat nBlue=8/255.0;
    CGFloat nGreen=4.0/255.0;
    UIColor *nightColor=[[UIColor alloc]initWithRed:nRed green:nBlue blue:nGreen alpha:1];
    self.navigationItem.title=@"Overview";
    
    self.navigationController.navigationBar.tintColor=nightColor;
    self.navigationController.navigationBar.translucent=YES;
    self.navigationController.toolbar.translucent=YES;
    
    // Gesture voor toggle navbar
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavBar:)];
    
        [self.view addGestureRecognizer:gesture];
    
    
    
    
    
    
    
    
    
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"Triatlas Index";
    [self.navigationItem setTitleView:titleLabel];
    
	

    overzichtsScroller.delegate=self;
    gesture.delegate=self;
    
    [[self overzichtsScroller] setContentSize:CGSizeMake(imgwidth, imgheight)];
	[[self overzichtsScroller] setAutoresizesSubviews:YES];
	[[self overzichtsScroller] setMaximumZoomScale:1.0f]; 
	[[self overzichtsScroller] setMinimumZoomScale:0.24f];
    [[self overzichtsScroller] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

	[self setImgView:[[UIImageView alloc] init] ] ;
	[[self imgView] setFrame:CGRectMake(0,0, imgwidth, imgheight)];
	
    [[self imgView] setImage:overzichtsimage];
    
	[[self imgView] setUserInteractionEnabled:YES];
    [[self overzichtsScroller] addSubview:imgView];
    [[self overzichtsScroller] zoomToRect: CGRectMake(10,296,173,50) animated:YES];
    
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
    
    [self addAreaButtonToMapAtPoint:CGRectMake(38,199,87,53) withTag:6];
    // Area 7 
    [self addAreaButtonToMapAtPoint:CGRectMake(125,199,163,53) withTag:7];
    
    // Area 8 
    [self addAreaButtonToMapAtPoint:CGRectMake(298,199,164,48) withTag:8];
    // Area 9 
    [self addAreaButtonToMapAtPoint:CGRectMake(459,199,163,53) withTag:9];
    // Area 10 
    [self addAreaButtonToMapAtPoint:CGRectMake(626,199,163,53) withTag:10];
    
    
    // Area 10-28
    [self addAreaButtonToMapAtPoint:CGRectMake(87,248,88,50) withTag:21];
    [self addAreaButtonToMapAtPoint:CGRectMake(180,248,95,52) withTag:22];
    [self addAreaButtonToMapAtPoint:CGRectMake(271,248,96,52) withTag:23];
    [self addAreaButtonToMapAtPoint:CGRectMake(363,248,92,52) withTag:24];
    [self addAreaButtonToMapAtPoint:CGRectMake(458,248,91,52) withTag:25];
    [self addAreaButtonToMapAtPoint:CGRectMake(550,248,94,52) withTag:26];
    [self addAreaButtonToMapAtPoint:CGRectMake(645,248,96,53) withTag:27];
    [self addAreaButtonToMapAtPoint:CGRectMake(735,248,92,52) withTag:28];
    [self addAreaButtonToMapAtPoint:CGRectMake(831,248,90,52) withTag:11];
    [self addAreaButtonToMapAtPoint:CGRectMake(924,248,88,52) withTag:12];
    [self addAreaButtonToMapAtPoint:CGRectMake(1016,248,88,52) withTag:13];
    [self addAreaButtonToMapAtPoint:CGRectMake(1111,248,96,52) withTag:14];
    [self addAreaButtonToMapAtPoint:CGRectMake(1202,248,94,52) withTag:15];
    [self addAreaButtonToMapAtPoint:CGRectMake(1295,248,92,52) withTag:16];
    [self addAreaButtonToMapAtPoint:CGRectMake(1389,248,93,52) withTag:17];
    [self addAreaButtonToMapAtPoint:CGRectMake(1483,248,92,52) withTag:18];
    [self addAreaButtonToMapAtPoint:CGRectMake(1576,248,95,52) withTag:19];
    [self addAreaButtonToMapAtPoint:CGRectMake(1667,248,50,52) withTag:20];
    [self addAreaButtonToMapAtPoint:CGRectMake(38,248,46,52) withTag:20];
    

    // Area  29-54
    [self addAreaButtonToMapAtPoint:CGRectMake(39,298, 30,51) withTag:42];
    [self addAreaButtonToMapAtPoint:CGRectMake(71 ,298, 66,51) withTag:43];
    [self addAreaButtonToMapAtPoint:CGRectMake(135 ,298, 59,51) withTag:44];
    [self addAreaButtonToMapAtPoint:CGRectMake(201 ,298, 60 ,51) withTag:45];
    [self addAreaButtonToMapAtPoint:CGRectMake(265 ,298,60 ,51) withTag:46];
    [self addAreaButtonToMapAtPoint:CGRectMake( 330,298, 60,51) withTag:47];
    [self addAreaButtonToMapAtPoint:CGRectMake( 394,298,60 ,51) withTag:48];
    [self addAreaButtonToMapAtPoint:CGRectMake( 459,298,60 ,51) withTag:49];
    [self addAreaButtonToMapAtPoint:CGRectMake(522 ,298, 60,51) withTag:50];
    [self addAreaButtonToMapAtPoint:CGRectMake(586 ,298, 60,51) withTag:51];
    [self addAreaButtonToMapAtPoint:CGRectMake( 650,298, 60,51) withTag:52];
    [self addAreaButtonToMapAtPoint:CGRectMake( 716,298, 60,51) withTag:53];
    [self addAreaButtonToMapAtPoint:CGRectMake( 782,298, 60,51) withTag:54];
    [self addAreaButtonToMapAtPoint:CGRectMake( 846,298, 60,51) withTag:29];
    [self addAreaButtonToMapAtPoint:CGRectMake(909 ,298,60 ,51) withTag:30];
    [self addAreaButtonToMapAtPoint:CGRectMake(973 ,298,60 ,51) withTag:31];
    [self addAreaButtonToMapAtPoint:CGRectMake(1037 ,298, 60,51) withTag:32];
    [self addAreaButtonToMapAtPoint:CGRectMake(1104 ,298,60 ,51) withTag:33];
    [self addAreaButtonToMapAtPoint:CGRectMake(1168 ,298, 60,51) withTag:34];
    [self addAreaButtonToMapAtPoint:CGRectMake(1231 ,298, 60,51) withTag:35];
    [self addAreaButtonToMapAtPoint:CGRectMake(1297 ,298,60 ,51) withTag:36];
    [self addAreaButtonToMapAtPoint:CGRectMake(1359 ,298, 60,51) withTag:37];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1427,298, 60,51) withTag:38];
    [self addAreaButtonToMapAtPoint:CGRectMake(1491 ,298, 60,51) withTag:39];
    [self addAreaButtonToMapAtPoint:CGRectMake(1553 ,298, 60,51) withTag:40];
    [self addAreaButtonToMapAtPoint:CGRectMake(1618 ,298,60 ,51) withTag:41];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1682,298,32 ,51) withTag:42];

    

    
    
     // Area  55-87
     [self addAreaButtonToMapAtPoint:CGRectMake(39,   347   ,48 ,51) withTag:72];
     [self addAreaButtonToMapAtPoint:CGRectMake(91 ,347,50 ,51) withTag:73];
     [self addAreaButtonToMapAtPoint:CGRectMake(142 ,347, 50,51) withTag:74];
     [self addAreaButtonToMapAtPoint:CGRectMake(194 ,347, 50,51) withTag:75];
     [self addAreaButtonToMapAtPoint:CGRectMake( 242,347,50 ,51) withTag:76];
     [self addAreaButtonToMapAtPoint:CGRectMake( 293,347,50 ,51) withTag:77];
     [self addAreaButtonToMapAtPoint:CGRectMake( 345,347, 50,51) withTag:78];
     [self addAreaButtonToMapAtPoint:CGRectMake(397 ,347,50 ,51) withTag:79];
     [self addAreaButtonToMapAtPoint:CGRectMake( 446,347, 50,51) withTag:80];
     [self addAreaButtonToMapAtPoint:CGRectMake(498 ,347,50 ,51) withTag:81];
     [self addAreaButtonToMapAtPoint:CGRectMake( 548,347,50 ,51) withTag:82];
     [self addAreaButtonToMapAtPoint:CGRectMake( 598,347, 50,51) withTag:83];
     [self addAreaButtonToMapAtPoint:CGRectMake( 650,347,50 ,51) withTag:84];
     [self addAreaButtonToMapAtPoint:CGRectMake( 699,347,50 ,51) withTag:85];
     [self addAreaButtonToMapAtPoint:CGRectMake( 751,347,50 ,51) withTag:86];
     [self addAreaButtonToMapAtPoint:CGRectMake( 800,347,50 ,51) withTag:87];
     [self addAreaButtonToMapAtPoint:CGRectMake( 852,347,50 ,51) withTag:55];
     [self addAreaButtonToMapAtPoint:CGRectMake( 902,347,50 ,51) withTag:56];
     [self addAreaButtonToMapAtPoint:CGRectMake( 954,347,50 ,51) withTag:57];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1005,347,50 ,51) withTag:58];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1055,347,50 ,51) withTag:59];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1104,347,50 ,51) withTag:60];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1156,347,50 ,51) withTag:61];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1207,347,50 ,51) withTag:62];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1257,347,50 ,51) withTag:63];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1307,347,50 ,51) withTag:64];
     [self addAreaButtonToMapAtPoint:CGRectMake(1361 ,347,50 ,51) withTag:65];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1410,347, 50,51) withTag:66];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1462,347,50 ,51) withTag:67];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1512,347,50 ,51) withTag:68];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1561,347,50 ,51) withTag:69];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1614,347,50 ,51) withTag:70];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1665,347, 50 ,51) withTag:71];
 
  
    // Area  88-125
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   398   , 20,51) withTag:107];
    [self addAreaButtonToMapAtPoint:CGRectMake(63 ,398,43,51) withTag:108];
    [self addAreaButtonToMapAtPoint:CGRectMake( 108,398,43 ,51) withTag:109];
    [self addAreaButtonToMapAtPoint:CGRectMake( 152,398, 43,51) withTag:110];
    [self addAreaButtonToMapAtPoint:CGRectMake( 194,398, 43,51) withTag:111];
    [self addAreaButtonToMapAtPoint:CGRectMake( 239,398,43 ,51) withTag:112];
    [self addAreaButtonToMapAtPoint:CGRectMake( 282,398,43 ,51) withTag:113];
    [self addAreaButtonToMapAtPoint:CGRectMake( 326,398,43 ,51) withTag:114];
    [self addAreaButtonToMapAtPoint:CGRectMake( 371,398,43 ,51) withTag:115];
    [self addAreaButtonToMapAtPoint:CGRectMake(414 ,398, 43,51) withTag:116];
    [self addAreaButtonToMapAtPoint:CGRectMake( 457, 398,43 ,51) withTag:117];
    [self addAreaButtonToMapAtPoint:CGRectMake( 505,398,43 ,51) withTag:118];
    [self addAreaButtonToMapAtPoint:CGRectMake(548 ,398,43 ,51) withTag:119];
    [self addAreaButtonToMapAtPoint:CGRectMake( 590,398,43,51) withTag:120];
    [self addAreaButtonToMapAtPoint:CGRectMake( 634,398,43 ,51) withTag:121];
    [self addAreaButtonToMapAtPoint:CGRectMake( 677,398,43 ,51) withTag:122];
    [self addAreaButtonToMapAtPoint:CGRectMake( 720,398,43 ,51) withTag:123];
    [self addAreaButtonToMapAtPoint:CGRectMake( 766,398,43,51) withTag:124];
    [self addAreaButtonToMapAtPoint:CGRectMake(810 ,398,43,51) withTag:125];
    [self addAreaButtonToMapAtPoint:CGRectMake( 853,398,43,51) withTag:88];
    [self addAreaButtonToMapAtPoint:CGRectMake(896 ,398,43,51) withTag:89];
    [self addAreaButtonToMapAtPoint:CGRectMake(943 ,398,43,51) withTag:90];
    [self addAreaButtonToMapAtPoint:CGRectMake( 984,398,43,51) withTag:91];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1033,398,43,51) withTag:92];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1075,398,43,51) withTag:93];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1121,398,43,51) withTag:94];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1165,398,43,51) withTag:95];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1209,398,43,51) withTag:96];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1255,398,43,51) withTag:97];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1295,398,43,51) withTag:98];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1341,398,43,51) withTag:99];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1387,398,43,51) withTag:100];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1429,398,43,51) withTag:101];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1473,398,43,51) withTag:102];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1517,398,43,51) withTag:103];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1561,398,43,51) withTag:104];
    [self addAreaButtonToMapAtPoint:CGRectMake(1605 ,398,43,51) withTag:105];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1649,398,43,51) withTag:106];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1693,398,23,51) withTag:107];
    
    

     // Area  126-168
     [self addAreaButtonToMapAtPoint:CGRectMake(39,   445   , 38,51) withTag:148];
     [self addAreaButtonToMapAtPoint:CGRectMake(80,445,38,51) withTag:149];
     [self addAreaButtonToMapAtPoint:CGRectMake( 119,445,38 ,51) withTag:150];
     [self addAreaButtonToMapAtPoint:CGRectMake( 155,445, 38,51) withTag:151];
     [self addAreaButtonToMapAtPoint:CGRectMake( 195,445, 38,51) withTag:152];
     [self addAreaButtonToMapAtPoint:CGRectMake(236 ,445,38,51) withTag:153];
     [self addAreaButtonToMapAtPoint:CGRectMake( 275,445,38 ,51) withTag:154];
     [self addAreaButtonToMapAtPoint:CGRectMake( 313,445, 38,51) withTag:155];
     [self addAreaButtonToMapAtPoint:CGRectMake(351 ,445,38 ,51) withTag:156];
     [self addAreaButtonToMapAtPoint:CGRectMake(391 ,445, 38,51) withTag:157];
     [self addAreaButtonToMapAtPoint:CGRectMake( 429,445,38 ,51) withTag:158];
     [self addAreaButtonToMapAtPoint:CGRectMake( 470,445,38 ,51) withTag:159];
     [self addAreaButtonToMapAtPoint:CGRectMake(508 ,445,38 ,51) withTag:160];
     [self addAreaButtonToMapAtPoint:CGRectMake(545 ,445, 38,51) withTag:161];
     [self addAreaButtonToMapAtPoint:CGRectMake( 585,445,38 ,51) withTag:162];
     [self addAreaButtonToMapAtPoint:CGRectMake(626 ,445,38 ,51) withTag:163];
     [self addAreaButtonToMapAtPoint:CGRectMake(664 ,445, 38,51) withTag:164];
     [self addAreaButtonToMapAtPoint:CGRectMake(702 ,445,38 ,51) withTag:165];
     [self addAreaButtonToMapAtPoint:CGRectMake( 741,445, 38,51) withTag:166];
     [self addAreaButtonToMapAtPoint:CGRectMake( 780,445,38 ,51) withTag:167];
     [self addAreaButtonToMapAtPoint:CGRectMake(820 ,445,38 ,51) withTag:168];
     [self addAreaButtonToMapAtPoint:CGRectMake(858 ,445,38 ,51) withTag:126];
     [self addAreaButtonToMapAtPoint:CGRectMake( 896,445,38 ,51) withTag:127];
     [self addAreaButtonToMapAtPoint:CGRectMake(936 ,445,38 ,51) withTag:128];
     [self addAreaButtonToMapAtPoint:CGRectMake(974 ,445,38 ,51) withTag:129];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1014,445,38 ,51) withTag:130];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1051,445,38 ,51) withTag:131];
     [self addAreaButtonToMapAtPoint:CGRectMake(1091 ,445,38 ,51) withTag:132];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1132,445,38 ,51) withTag:133];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1168,445,38 ,51) withTag:134];
     [self addAreaButtonToMapAtPoint:CGRectMake(1208,445,38 ,51) withTag:135];
     [self addAreaButtonToMapAtPoint:CGRectMake(1248 ,445,38 ,51) withTag:136];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1287,445,38 ,51) withTag:137];
     [self addAreaButtonToMapAtPoint:CGRectMake(1324 ,445,38 ,51) withTag:138];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1365,445,38 ,51) withTag:139];
     [self addAreaButtonToMapAtPoint:CGRectMake(1405 ,445, 38,51) withTag:140];
     [self addAreaButtonToMapAtPoint:CGRectMake(1445 ,445,38 ,51) withTag:141];
     [self addAreaButtonToMapAtPoint:CGRectMake(1482 ,445,38 ,51) withTag:142];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1520,445,38 ,51) withTag:143];
     [self addAreaButtonToMapAtPoint:CGRectMake(1559 ,445,38 ,51) withTag:144];
     [self addAreaButtonToMapAtPoint:CGRectMake( 1598,445, 38,51) withTag:145];
     [self addAreaButtonToMapAtPoint:CGRectMake(1636 ,445,38 ,51) withTag:146];
     [self addAreaButtonToMapAtPoint:CGRectMake(1676 ,445,38 ,51) withTag:147];
     

    
    // Area  1480
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   496   , 17,51) withTag:192];
    [self addAreaButtonToMapAtPoint:CGRectMake(57,496,35,51) withTag:193];
    [self addAreaButtonToMapAtPoint:CGRectMake( 95,496,35 ,51) withTag:194];
    [self addAreaButtonToMapAtPoint:CGRectMake( 131,496, 35,51) withTag:195];
    [self addAreaButtonToMapAtPoint:CGRectMake( 165,496, 35,51) withTag:196];
    [self addAreaButtonToMapAtPoint:CGRectMake(204 ,496,35,51) withTag:197];
    [self addAreaButtonToMapAtPoint:CGRectMake( 240,496,35 ,51) withTag:198];
    [self addAreaButtonToMapAtPoint:CGRectMake( 276,496, 35,51) withTag:199];
    [self addAreaButtonToMapAtPoint:CGRectMake(312 ,496,35 ,51) withTag:200];
    [self addAreaButtonToMapAtPoint:CGRectMake(350 ,496, 35,51) withTag:201];
    [self addAreaButtonToMapAtPoint:CGRectMake( 383,496,35 ,51) withTag:202];
    [self addAreaButtonToMapAtPoint:CGRectMake( 420,496,35 ,51) withTag:203];
    [self addAreaButtonToMapAtPoint:CGRectMake(459 ,496,35 ,51) withTag:204];
    [self addAreaButtonToMapAtPoint:CGRectMake(496 ,496, 35,51) withTag:205];
    [self addAreaButtonToMapAtPoint:CGRectMake( 532,496,35 ,51) withTag:206];
    [self addAreaButtonToMapAtPoint:CGRectMake(569 ,496,35 ,51) withTag:207];
    [self addAreaButtonToMapAtPoint:CGRectMake(603 ,496, 35,51) withTag:208];
    [self addAreaButtonToMapAtPoint:CGRectMake(641 ,496,35 ,51) withTag:209];
    [self addAreaButtonToMapAtPoint:CGRectMake( 676,496, 35,51) withTag:210];
    [self addAreaButtonToMapAtPoint:CGRectMake( 713,496,35 ,51) withTag:211];
    [self addAreaButtonToMapAtPoint:CGRectMake(751 ,496,35 ,51) withTag:212];
    [self addAreaButtonToMapAtPoint:CGRectMake(787 ,496,35 ,51) withTag:213];
    [self addAreaButtonToMapAtPoint:CGRectMake( 823,496,35 ,51) withTag:214];
    [self addAreaButtonToMapAtPoint:CGRectMake(857 ,496,35 ,51) withTag:169];
    [self addAreaButtonToMapAtPoint:CGRectMake(896 ,496,35 ,51) withTag:170];
    [self addAreaButtonToMapAtPoint:CGRectMake( 930,496,35 ,51) withTag:171];
    [self addAreaButtonToMapAtPoint:CGRectMake( 967,496,35 ,51) withTag:172];
    [self addAreaButtonToMapAtPoint:CGRectMake(1006 ,496,35 ,51) withTag:173];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1041,496,35 ,51) withTag:174];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1077,496,35 ,51) withTag:175];
    [self addAreaButtonToMapAtPoint:CGRectMake(1113,496,35 ,51) withTag:176];
    [self addAreaButtonToMapAtPoint:CGRectMake(1149 ,496,35 ,51) withTag:177];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1187,496,35 ,51) withTag:178];
    [self addAreaButtonToMapAtPoint:CGRectMake(1223 ,496,35 ,51) withTag:179];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1261,496,35 ,51) withTag:180];
    [self addAreaButtonToMapAtPoint:CGRectMake(1296 ,496, 35,51) withTag:181];
    [self addAreaButtonToMapAtPoint:CGRectMake(1332 ,496,35 ,51) withTag:182];
    [self addAreaButtonToMapAtPoint:CGRectMake(1370 ,496,35 ,51) withTag:183];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1406,496,35 ,51) withTag:184];
    [self addAreaButtonToMapAtPoint:CGRectMake(1442 ,496,35 ,51) withTag:185];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1479,496, 35,51) withTag:186];
    [self addAreaButtonToMapAtPoint:CGRectMake(1515 ,496,35 ,51) withTag:187];
    [self addAreaButtonToMapAtPoint:CGRectMake(1550 ,496,35 ,51) withTag:188];
    [self addAreaButtonToMapAtPoint:CGRectMake(1589 ,496,35 ,51) withTag:189];
    [self addAreaButtonToMapAtPoint:CGRectMake(1625 ,496,35 ,51) withTag:190];
    [self addAreaButtonToMapAtPoint:CGRectMake(1661 ,496,35 ,51) withTag:191];
    [self addAreaButtonToMapAtPoint:CGRectMake(1696 ,496,35 ,51) withTag:192];

    
    
    
    

    /* 
     // Area  55-87
     [self addAreaButtonToMapAtPoint:CGRectMake(39,   347   , 52,51) withTag:107];
     [self addAreaButtonToMapAtPoint:CGRectMake(91 ,347,48,51) withTag:108];
     [self addAreaButtonToMapAtPoint:CGRectMake( 143,347,46 ,51) withTag:109];
     [self addAreaButtonToMapAtPoint:CGRectMake( 192,347, 50,51) withTag:110];
     [self addAreaButtonToMapAtPoint:CGRectMake( 242,347, 23,51) withTag:111];
     
     [self addAreaButtonToMapAtPoint:CGRectMake( ,347, ,51) withTag:112];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,347, ,51) withTag:113];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,347, ,51) withTag:114];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,347, ,51) withTag:115];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,347, ,51) withTag:116];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:117];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:118];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:119];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:120];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:121];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:122];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:123];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:124];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:125];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:88];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:89];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:90];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:91];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:92];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:93];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:94];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:95];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:96];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:97];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:98];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:99];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:100];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:101];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:102];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:103];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:104];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:105];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:106];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:107];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:108];
     [self addAreaButtonToMapAtPoint:CGRectMake( ,298, ,51) withTag:109];
     
     */

    
    
    
    
    
    
    
    
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

//    UIBarButtonItem *nightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"84-lightbulb.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(night_clicked:)];
                                    
  //  UIBarButtonItem *flipButton =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"01-refresh.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(flip_clicked:)];
    
  //  UIBarButtonItem *mirrorButton = [[UIBarButtonItem alloc]
   //                                  initWithTitle:@"M" style:UIBarButtonItemStyleBordered target:self action:@selector(mirror_clicked:)];
    
//    UIBarButtonItem *invertButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"62-contrast.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(invert_clicked:)];
    
    
    UIBarButtonItem *sliderAsToolbarItem = [[UIBarButtonItem alloc] initWithCustomView:brightnessSlider ];
    // Set the width of aSlider
    [sliderAsToolbarItem setWidth:100.0];
    
    [self setToolbarItems:[NSArray arrayWithObjects:nightButton, sliderAsToolbarItem,    nil]];
    
    [self.navigationController setToolbarHidden:FALSE];
    self.navigationController.toolbar.tintColor=nightColor;
    
    
    
    self.navigationController.toolbarHidden=FALSE;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.brightness=1.0;

    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)sv{
    return imgView;
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
    [AreaButton addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:AreaButton];
    [AreaButton setTag:areatag];
    [AreaButton setAlpha:0.2];
 	AreaButtonList[areatag] = AreaButton; 	
}



- (void) viewWillAppear:(BOOL)animated {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.isNight) { [self makeNight];}
    if (!appDelegate.isNight) { [self makeDay];}
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

-(IBAction)night_clicked:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.isNight) {
        
        [self makeDay];
    } 
    else {
        
        
        [self makeNight];
    }
}
    
-(IBAction)buttoninfoclick:(id)sender {
    NSString *AlertTxt;
    
    AlertTxt=@"Skymap\nApp development:\nNorbert Schmidt\nCharts:\nJose Torres";
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"About Skymaps" message:AlertTxt delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];

    
}

-(void) makeNight {
    NSString *strImageName=@"";
    strImageName=@"index.png";
    imgView.image=	[UIImage imageNamed:strImageName];
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
    self.navigationController.navigationBar.alpha=0.2;
    self.navigationController.toolbar.alpha=0.2;

    imgView.image=returnImage;
    UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    lbl.textAlignment=UITextAlignmentCenter;
    lbl.backgroundColor=[UIColor clearColor];
    lbl.textColor=nightColor;
    self.navigationController.navigationItem.titleView=lbl;
    appDelegate.isNight=TRUE;

  

    
    
}

-(void) makeDay {

    [self invert_clicked:nil];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    brightnessSlider.alpha=1.0;
    self.navigationController.toolbar.alpha=1.0;
    self.navigationController.navigationBar.alpha=1.0;
    NSString *strImageName=@"index.png";
    imgView.image=	[UIImage imageNamed:strImageName];
    appDelegate.isNight=FALSE; 
}



- (void)viewWillDisappear:(BOOL)animated {
 //   [toolbar removeFromSuperview];
    [super viewWillDisappear:animated];
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
    return YES;
}





-(void)setLandscapeView{
 //   CGRect rectangle = CGRectMake(0, 0, 1024, 665);
 //   overzichtsScroller.frame=rectangle;
    
    
}


-(void)setPortraitView{
   // CGRect rectangle = CGRectMake(0, 0, 768, 469);
 //   overzichtsScroller.frame=rectangle;
} 



- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self setLandscapeView];
        
    }else {
        [self setPortraitView];
        
        
    }
    
}




@end
