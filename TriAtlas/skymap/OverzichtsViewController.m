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
#import <QuartzCore/QuartzCore.h>
#import "IASKAppSettingsViewController.h"
@interface OverzichtsViewController ()

@end

@implementation OverzichtsViewController
@synthesize overzichtsScroller,imgView;
@synthesize nightButton, settingsButton;
@synthesize brightnessSlider;


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }
    return YES;
}


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





- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImage *overzichtsimage=	[UIImage imageNamed:@"index.png"];
    int imgwidth=overzichtsimage.size.width;
    int imgheight=overzichtsimage.size.height;

    
    self.navigationController.toolbar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.navigationController.toolbar.translucent = YES;
    
    self.navigationController.navigationBar.translucent = YES;
    

    self.title=@"Triatlas Index";




    
    
 //   UIBarButtonItem *btnHelp = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIButtonTypeInfoDark target:self action:@selector(showHelp:)  ];

//    btnHelp.tintColor=[self lightnightColor];

   // self.navigationItem.rightBarButtonItem = btnHelp;

    // Gesture voor toggle navbar
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavBar:)];
    [self.view addGestureRecognizer:gesture];
        
    overzichtsScroller.delegate=self;
    gesture.delegate=self;
    
    [[self overzichtsScroller] setContentSize:CGSizeMake(imgwidth, imgheight)];
	[[self overzichtsScroller] setAutoresizesSubviews:YES];
	[[self overzichtsScroller] setMaximumZoomScale:1.5f]; 
	[[self overzichtsScroller] setMinimumZoomScale:0.24f];
    [[self overzichtsScroller] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

	[self setImgView:[[UIImageView alloc] init] ] ;
	[[self imgView] setFrame:CGRectMake(0,0, imgwidth, imgheight)];
	
    [[self imgView] setImage:overzichtsimage];
    
	[[self imgView] setUserInteractionEnabled:YES];
    [[self overzichtsScroller] addSubview:imgView];
    [[self overzichtsScroller] zoomToRect: CGRectMake(896,445,38 ,51) animated:NO];
    [[self overzichtsScroller] setZoomScale:1.0];
    
    
    
    
    /// AREADEFINITIES ///
//    1- 6
    [self addAreaButtonToMapAtPoint:CGRectMake(38,196,87,50) withTag:6];
    [self addAreaButtonToMapAtPoint:CGRectMake(791,196,173,50) withTag:1];
    [self addAreaButtonToMapAtPoint:CGRectMake(961,196,170,50) withTag:2];
    [self addAreaButtonToMapAtPoint:CGRectMake(1129,196,168,50) withTag:3];
    [self addAreaButtonToMapAtPoint:CGRectMake(1292,196,163,50) withTag:4];
    [self addAreaButtonToMapAtPoint:CGRectMake(1462,196,173,50) withTag:5];
    [self addAreaButtonToMapAtPoint:CGRectMake(1630,196,93,50) withTag:6];
    [self addAreaButtonToMapAtPoint:CGRectMake(125,196,163,50) withTag:7];
    [self addAreaButtonToMapAtPoint:CGRectMake(298,196,164,50) withTag:8];
    [self addAreaButtonToMapAtPoint:CGRectMake(459,196,163,50) withTag:9];
    [self addAreaButtonToMapAtPoint:CGRectMake(626,196,163,50) withTag:10];
    
    
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
     
    // Area  169-214
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   496   , 17,51) withTag:192];
    [self addAreaButtonToMapAtPoint:CGRectMake(56,496,35,51) withTag:193];
    [self addAreaButtonToMapAtPoint:CGRectMake( 92,496,35 ,51) withTag:194];
    [self addAreaButtonToMapAtPoint:CGRectMake( 132,496, 35,51) withTag:195];
    [self addAreaButtonToMapAtPoint:CGRectMake( 170,496, 35,51) withTag:196];
    [self addAreaButtonToMapAtPoint:CGRectMake(208 ,496,35,51) withTag:197];
    [self addAreaButtonToMapAtPoint:CGRectMake( 246,496,35 ,51) withTag:198];
    [self addAreaButtonToMapAtPoint:CGRectMake( 282,496, 35,51) withTag:199];
    [self addAreaButtonToMapAtPoint:CGRectMake(318 ,496,35 ,51) withTag:200];
    [self addAreaButtonToMapAtPoint:CGRectMake(354 ,496, 35,51) withTag:201];
    [self addAreaButtonToMapAtPoint:CGRectMake( 388,496,35 ,51) withTag:202];
    [self addAreaButtonToMapAtPoint:CGRectMake( 424,496,35 ,51) withTag:203];
    [self addAreaButtonToMapAtPoint:CGRectMake(460 ,496,35 ,51) withTag:204];
    [self addAreaButtonToMapAtPoint:CGRectMake(496 ,496, 35,51) withTag:205];
    [self addAreaButtonToMapAtPoint:CGRectMake( 532,496,35 ,51) withTag:206];
    [self addAreaButtonToMapAtPoint:CGRectMake(568 ,496,35 ,51) withTag:207];
    [self addAreaButtonToMapAtPoint:CGRectMake(604 ,496, 35,51) withTag:208];
    [self addAreaButtonToMapAtPoint:CGRectMake(640 ,496,35 ,51) withTag:209];
    [self addAreaButtonToMapAtPoint:CGRectMake( 676,496, 35,51) withTag:210];
    [self addAreaButtonToMapAtPoint:CGRectMake( 712,496,35 ,51) withTag:211];
    [self addAreaButtonToMapAtPoint:CGRectMake(748 ,496,35 ,51) withTag:212];
    [self addAreaButtonToMapAtPoint:CGRectMake(784 ,496,35 ,51) withTag:213];
    [self addAreaButtonToMapAtPoint:CGRectMake( 820,496,35 ,51) withTag:214];
    [self addAreaButtonToMapAtPoint:CGRectMake(856 ,496,35 ,51) withTag:169];
    [self addAreaButtonToMapAtPoint:CGRectMake(892 ,496,35 ,51) withTag:170];
    [self addAreaButtonToMapAtPoint:CGRectMake( 929,496,35 ,51) withTag:171];
    [self addAreaButtonToMapAtPoint:CGRectMake( 966,496,35 ,51) withTag:172];
    [self addAreaButtonToMapAtPoint:CGRectMake(1001 ,496,35 ,51) withTag:173];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1037,496,35 ,51) withTag:174];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1073,496,35 ,51) withTag:175];
    [self addAreaButtonToMapAtPoint:CGRectMake(1109,496,35 ,51) withTag:176];
    [self addAreaButtonToMapAtPoint:CGRectMake(1147 ,496,35 ,51) withTag:177];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1183,496,35 ,51) withTag:178];
    [self addAreaButtonToMapAtPoint:CGRectMake(1220 ,496,35 ,51) withTag:179];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1257,496,35 ,51) withTag:180];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1294 ,496, 35,51) withTag:181];
    [self addAreaButtonToMapAtPoint:CGRectMake(1331 ,496,35 ,51) withTag:182];
    [self addAreaButtonToMapAtPoint:CGRectMake(1368 ,496,35 ,51) withTag:183];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1405,496,35 ,51) withTag:184];
    [self addAreaButtonToMapAtPoint:CGRectMake(1442 ,496,35 ,51) withTag:185];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1479,496, 35,51) withTag:186];
    [self addAreaButtonToMapAtPoint:CGRectMake(1516 ,496,35 ,51) withTag:187];
    [self addAreaButtonToMapAtPoint:CGRectMake(1553 ,496,35 ,51) withTag:188];
    [self addAreaButtonToMapAtPoint:CGRectMake(1590 ,496,35 ,51) withTag:189];
    [self addAreaButtonToMapAtPoint:CGRectMake(1627 ,496,35 ,51) withTag:190];
    [self addAreaButtonToMapAtPoint:CGRectMake(1664 ,496,35 ,51) withTag:191];
    [self addAreaButtonToMapAtPoint:CGRectMake(1701 ,496,14 ,51) withTag:192];


    
    
    // Area  215-262
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   544  , 17,51) withTag:239];
    [self addAreaButtonToMapAtPoint:CGRectMake(56,544,35,51) withTag:240];
    [self addAreaButtonToMapAtPoint:CGRectMake( 92,544,35 ,51) withTag:241];
    [self addAreaButtonToMapAtPoint:CGRectMake( 128,544, 35,51) withTag:242];
    [self addAreaButtonToMapAtPoint:CGRectMake( 163,544, 35,51) withTag:243];
    [self addAreaButtonToMapAtPoint:CGRectMake(198 ,544,35,51) withTag:244];
    [self addAreaButtonToMapAtPoint:CGRectMake( 233,544,35 ,51) withTag:245];
    [self addAreaButtonToMapAtPoint:CGRectMake( 268,544, 35,51) withTag:246];
    [self addAreaButtonToMapAtPoint:CGRectMake(303 ,544,35 ,51) withTag:247];
    [self addAreaButtonToMapAtPoint:CGRectMake(338 ,544, 35,51) withTag:248];
    [self addAreaButtonToMapAtPoint:CGRectMake( 373,544,35 ,51) withTag:249];
    [self addAreaButtonToMapAtPoint:CGRectMake( 408,544,35 ,51) withTag:250];
    [self addAreaButtonToMapAtPoint:CGRectMake(442 ,544,35 ,51) withTag:251];
    [self addAreaButtonToMapAtPoint:CGRectMake(477 ,544, 35,51) withTag:252];
    [self addAreaButtonToMapAtPoint:CGRectMake( 512,544,35 ,51) withTag:253];
    [self addAreaButtonToMapAtPoint:CGRectMake(547 ,544,35 ,51) withTag:254];
    [self addAreaButtonToMapAtPoint:CGRectMake(582 ,544, 35,51) withTag:255];
    [self addAreaButtonToMapAtPoint:CGRectMake(617 ,544,35 ,51) withTag:256];
    [self addAreaButtonToMapAtPoint:CGRectMake( 652,544, 35,51) withTag:257];
    [self addAreaButtonToMapAtPoint:CGRectMake( 687,544,35 ,51) withTag:258];
    [self addAreaButtonToMapAtPoint:CGRectMake(722 ,544,35 ,51) withTag:259];
    [self addAreaButtonToMapAtPoint:CGRectMake(757 ,544,35 ,51) withTag:260];
    [self addAreaButtonToMapAtPoint:CGRectMake( 792,544,35 ,51) withTag:261];
    [self addAreaButtonToMapAtPoint:CGRectMake(827,544,35 ,51) withTag:262];
    [self addAreaButtonToMapAtPoint:CGRectMake(862 ,544,35 ,51) withTag:215];
    [self addAreaButtonToMapAtPoint:CGRectMake( 897,544,35 ,51) withTag:216];
    [self addAreaButtonToMapAtPoint:CGRectMake( 932,544,35 ,51) withTag:217];
    [self addAreaButtonToMapAtPoint:CGRectMake(967 ,544,35 ,51) withTag:218];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1002,544,35 ,51) withTag:219];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1037,544,35 ,51) withTag:220];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1072,544,35 ,51) withTag:221];
    [self addAreaButtonToMapAtPoint:CGRectMake(1107 ,544,35 ,51) withTag:222];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1142,544,35 ,51) withTag:223];
    [self addAreaButtonToMapAtPoint:CGRectMake(1177 ,544,35 ,51) withTag:224];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1212,544,35 ,51) withTag:225];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1247 ,544, 35,51) withTag:226];
    [self addAreaButtonToMapAtPoint:CGRectMake(1282 ,544,35 ,51) withTag:227];
    [self addAreaButtonToMapAtPoint:CGRectMake(1317 ,544,35 ,51) withTag:228];
    [self addAreaButtonToMapAtPoint:CGRectMake( 1352,544,35 ,51) withTag:229];
    [self addAreaButtonToMapAtPoint:CGRectMake(1387 ,544,35 ,51) withTag:230];
    [self addAreaButtonToMapAtPoint:CGRectMake(1422,544, 35,51) withTag:231];
    [self addAreaButtonToMapAtPoint:CGRectMake(1457 ,544,35 ,51) withTag:232];
    [self addAreaButtonToMapAtPoint:CGRectMake(1492 ,544,35 ,51) withTag:233];
    [self addAreaButtonToMapAtPoint:CGRectMake(1527 ,544,35 ,51) withTag:234];
    [self addAreaButtonToMapAtPoint:CGRectMake(1562 ,544,35 ,51) withTag:235];
    [self addAreaButtonToMapAtPoint:CGRectMake(1597 ,544,35 ,51) withTag:236];
    [self addAreaButtonToMapAtPoint:CGRectMake(1632 ,544,35 ,51) withTag:237];
    [self addAreaButtonToMapAtPoint:CGRectMake(1667 ,544,35 ,51) withTag:238];
    [self addAreaButtonToMapAtPoint:CGRectMake(1702 ,544,10 ,51) withTag:239];
    
    
    
     // Area  263-309
     [self addAreaButtonToMapAtPoint:CGRectMake(39,   594   , 35,51) withTag:287];
     [self addAreaButtonToMapAtPoint:CGRectMake(75,594,35,51) withTag:288];
     [self addAreaButtonToMapAtPoint:CGRectMake(110,594,35 ,51) withTag:289];
     [self addAreaButtonToMapAtPoint:CGRectMake(145,594, 35,51) withTag:290];
     [self addAreaButtonToMapAtPoint:CGRectMake(180,594, 35,51) withTag:291];
     [self addAreaButtonToMapAtPoint:CGRectMake(215 ,594,35,51) withTag:292];
     [self addAreaButtonToMapAtPoint:CGRectMake(252,594,35 ,51) withTag:293];
     [self addAreaButtonToMapAtPoint:CGRectMake(287,594, 35,51) withTag:294];
     [self addAreaButtonToMapAtPoint:CGRectMake(322 ,594,35 ,51) withTag:295];
     [self addAreaButtonToMapAtPoint:CGRectMake(357 ,594, 36,51) withTag:296];
     [self addAreaButtonToMapAtPoint:CGRectMake(392,594,35 ,51) withTag:297];
     [self addAreaButtonToMapAtPoint:CGRectMake(427,594,35 ,51) withTag:298];
     [self addAreaButtonToMapAtPoint:CGRectMake(463 ,594,35 ,51) withTag:299];
     [self addAreaButtonToMapAtPoint:CGRectMake(500 ,594, 35,51) withTag:300];
     [self addAreaButtonToMapAtPoint:CGRectMake(536,594,35 ,51) withTag:301];
     [self addAreaButtonToMapAtPoint:CGRectMake(572 ,594,35 ,51) withTag:302];
     [self addAreaButtonToMapAtPoint:CGRectMake(608 ,594, 35,51) withTag:303];
     [self addAreaButtonToMapAtPoint:CGRectMake(644 ,594,35 ,51) withTag:304];
     [self addAreaButtonToMapAtPoint:CGRectMake(680,594, 35,51) withTag:305];
     [self addAreaButtonToMapAtPoint:CGRectMake(716,594,35 ,51) withTag:306];
     [self addAreaButtonToMapAtPoint:CGRectMake(752,594,35 ,51) withTag:307];
     [self addAreaButtonToMapAtPoint:CGRectMake(788,594,35 ,51) withTag:308];
     [self addAreaButtonToMapAtPoint:CGRectMake(824,594,35 ,51) withTag:209];
     [self addAreaButtonToMapAtPoint:CGRectMake(860,594,35 ,51) withTag:263];
     [self addAreaButtonToMapAtPoint:CGRectMake(896,594,35 ,51) withTag:264];
     [self addAreaButtonToMapAtPoint:CGRectMake(932,594,35 ,51) withTag:265];
     [self addAreaButtonToMapAtPoint:CGRectMake(968,594,35 ,51) withTag:266];
     [self addAreaButtonToMapAtPoint:CGRectMake(1004,594,35 ,51) withTag:267];
     [self addAreaButtonToMapAtPoint:CGRectMake(1040,594,35 ,51) withTag:268];
     [self addAreaButtonToMapAtPoint:CGRectMake(1076,594,35 ,51) withTag:269];
     [self addAreaButtonToMapAtPoint:CGRectMake(1112,594,35 ,51) withTag:270];
     [self addAreaButtonToMapAtPoint:CGRectMake(1148,594,35 ,51) withTag:271];
     [self addAreaButtonToMapAtPoint:CGRectMake(1184,594,35 ,51) withTag:272];
     [self addAreaButtonToMapAtPoint:CGRectMake(1220,594,35 ,51) withTag:273];
     [self addAreaButtonToMapAtPoint:CGRectMake(1256,594,35 ,51) withTag:274];
     [self addAreaButtonToMapAtPoint:CGRectMake(1292,594, 35,51) withTag:275];
     [self addAreaButtonToMapAtPoint:CGRectMake(1328,594,35 ,51) withTag:276];
     [self addAreaButtonToMapAtPoint:CGRectMake(1364,594,35 ,51) withTag:277];
     [self addAreaButtonToMapAtPoint:CGRectMake(1400,594,35 ,51) withTag:278];
     [self addAreaButtonToMapAtPoint:CGRectMake(1436,594,35 ,51) withTag:279];
     [self addAreaButtonToMapAtPoint:CGRectMake(1468,594, 35,51) withTag:280];
     [self addAreaButtonToMapAtPoint:CGRectMake(1504,594,35 ,51) withTag:281];
     [self addAreaButtonToMapAtPoint:CGRectMake(1540,594,35 ,51) withTag:282];
     [self addAreaButtonToMapAtPoint:CGRectMake(1576,594,35 ,51) withTag:283];
     [self addAreaButtonToMapAtPoint:CGRectMake(1612,594,35 ,51) withTag:284];
     [self addAreaButtonToMapAtPoint:CGRectMake(1648,594,35 ,51) withTag:285];
     [self addAreaButtonToMapAtPoint:CGRectMake(1684,594,35 ,51) withTag:286];

     
    
    // 310- 357
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   643   , 17,51) withTag:334];
    [self addAreaButtonToMapAtPoint:CGRectMake(58,643,36,51) withTag:335];
    [self addAreaButtonToMapAtPoint:CGRectMake(94,643,36 ,51) withTag:336];
    [self addAreaButtonToMapAtPoint:CGRectMake(129,643, 36,51) withTag:337];
    [self addAreaButtonToMapAtPoint:CGRectMake(164,643, 36,51) withTag:338];
    [self addAreaButtonToMapAtPoint:CGRectMake(199 ,643,36,51) withTag:339];
    [self addAreaButtonToMapAtPoint:CGRectMake(234,643,36 ,51) withTag:340];
    [self addAreaButtonToMapAtPoint:CGRectMake(271,643, 36,51) withTag:341];
    [self addAreaButtonToMapAtPoint:CGRectMake(306 ,643,36 ,51) withTag:342];
    [self addAreaButtonToMapAtPoint:CGRectMake(341 ,643, 36,51) withTag:343];
    [self addAreaButtonToMapAtPoint:CGRectMake(376,643,36 ,51) withTag:344];
    [self addAreaButtonToMapAtPoint:CGRectMake(411,643,36 ,51) withTag:345];
    [self addAreaButtonToMapAtPoint:CGRectMake(446 ,643,36 ,51) withTag:346];
    [self addAreaButtonToMapAtPoint:CGRectMake(481 ,643, 36,51) withTag:347];
    [self addAreaButtonToMapAtPoint:CGRectMake(516,643,36 ,51) withTag:348];
    [self addAreaButtonToMapAtPoint:CGRectMake(551 ,643,36 ,51) withTag:349];
    [self addAreaButtonToMapAtPoint:CGRectMake(586 ,643, 36,51) withTag:350];
    [self addAreaButtonToMapAtPoint:CGRectMake(621 ,643,36 ,51) withTag:351];
    [self addAreaButtonToMapAtPoint:CGRectMake(656,643, 36,51) withTag:352];
    [self addAreaButtonToMapAtPoint:CGRectMake(691,643,36 ,51) withTag:353];
    [self addAreaButtonToMapAtPoint:CGRectMake(725,643,36 ,51) withTag:354];
    [self addAreaButtonToMapAtPoint:CGRectMake(760,643,36 ,51) withTag:355];
    [self addAreaButtonToMapAtPoint:CGRectMake(794,643,36 ,51) withTag:356];
    [self addAreaButtonToMapAtPoint:CGRectMake(828,643,36 ,51) withTag:357];
    [self addAreaButtonToMapAtPoint:CGRectMake(862,643,36 ,51) withTag:310];
    [self addAreaButtonToMapAtPoint:CGRectMake(896,643,36 ,51) withTag:311];
    [self addAreaButtonToMapAtPoint:CGRectMake(930,643,36 ,51) withTag:312];
    [self addAreaButtonToMapAtPoint:CGRectMake(964,643,36 ,51) withTag:313];
    [self addAreaButtonToMapAtPoint:CGRectMake(998,643,36 ,51) withTag:314];
    [self addAreaButtonToMapAtPoint:CGRectMake(1032,643,36 ,51) withTag:315];
    [self addAreaButtonToMapAtPoint:CGRectMake(1066,643,36 ,51) withTag:316];
    [self addAreaButtonToMapAtPoint:CGRectMake(1101,643,36 ,51) withTag:317];
    [self addAreaButtonToMapAtPoint:CGRectMake(1136,643,36 ,51) withTag:318];
    [self addAreaButtonToMapAtPoint:CGRectMake(1171,643,36 ,51) withTag:319];
    [self addAreaButtonToMapAtPoint:CGRectMake(1206,643,36 ,51) withTag:320];
    [self addAreaButtonToMapAtPoint:CGRectMake(1241,643, 36,51) withTag:321];
    [self addAreaButtonToMapAtPoint:CGRectMake(1276,643,36 ,51) withTag:322];
    [self addAreaButtonToMapAtPoint:CGRectMake(1311,643,36 ,51) withTag:323];
    [self addAreaButtonToMapAtPoint:CGRectMake(1346,643,36 ,51) withTag:324];
    [self addAreaButtonToMapAtPoint:CGRectMake(1381,643,36 ,51) withTag:325];
    [self addAreaButtonToMapAtPoint:CGRectMake(1416,643, 36,51) withTag:326];
    [self addAreaButtonToMapAtPoint:CGRectMake(1451,643,36 ,51) withTag:327];
    [self addAreaButtonToMapAtPoint:CGRectMake(1486,643,36 ,51) withTag:328];
    [self addAreaButtonToMapAtPoint:CGRectMake(1521,643,36 ,51) withTag:329];
    [self addAreaButtonToMapAtPoint:CGRectMake(1556,643,36 ,51) withTag:330];
    [self addAreaButtonToMapAtPoint:CGRectMake(1591,643,36 ,51) withTag:331];
    [self addAreaButtonToMapAtPoint:CGRectMake(1626,643,36 ,51) withTag:332];
    [self addAreaButtonToMapAtPoint:CGRectMake(1661,643,36 ,51) withTag:333];
    [self addAreaButtonToMapAtPoint:CGRectMake(1696,643,20 ,51) withTag:334];
    
    
    // 358 - 403
    [self addAreaButtonToMapAtPoint:CGRectMake(39,   692   , 15,51) withTag:381];
    [self addAreaButtonToMapAtPoint:CGRectMake(58,692,36,51) withTag:382];
    [self addAreaButtonToMapAtPoint:CGRectMake(94,692,36 ,51) withTag:383];
    [self addAreaButtonToMapAtPoint:CGRectMake(129,692, 36,51) withTag:384];
    [self addAreaButtonToMapAtPoint:CGRectMake(164,692, 36,51) withTag:385];
    [self addAreaButtonToMapAtPoint:CGRectMake(203 ,692,36,51) withTag:386];
    [self addAreaButtonToMapAtPoint:CGRectMake(240,692,36 ,51) withTag:387];
    [self addAreaButtonToMapAtPoint:CGRectMake(275,692, 36,51) withTag:388];
    [self addAreaButtonToMapAtPoint:CGRectMake(313 ,692,36 ,51) withTag:389];
    [self addAreaButtonToMapAtPoint:CGRectMake(348 ,692, 36,51) withTag:390];
    [self addAreaButtonToMapAtPoint:CGRectMake(383,692,36 ,51) withTag:391];
    [self addAreaButtonToMapAtPoint:CGRectMake(418,692,36 ,51) withTag:392];
    [self addAreaButtonToMapAtPoint:CGRectMake(458 ,692,36 ,51) withTag:393];
    [self addAreaButtonToMapAtPoint:CGRectMake(494 ,692, 36,51) withTag:394];
    [self addAreaButtonToMapAtPoint:CGRectMake(530,692,36 ,51) withTag:395];
    [self addAreaButtonToMapAtPoint:CGRectMake(566 ,692,36 ,51) withTag:396];
    [self addAreaButtonToMapAtPoint:CGRectMake(603 ,692, 36,51) withTag:397];
    [self addAreaButtonToMapAtPoint:CGRectMake(639 ,692,36 ,51) withTag:398];
    [self addAreaButtonToMapAtPoint:CGRectMake(675,692, 36,51) withTag:399];
    [self addAreaButtonToMapAtPoint:CGRectMake(711,692,36 ,51) withTag:400];
    [self addAreaButtonToMapAtPoint:CGRectMake(747,692,36 ,51) withTag:401];
    [self addAreaButtonToMapAtPoint:CGRectMake(783,692,36 ,51) withTag:402];
    [self addAreaButtonToMapAtPoint:CGRectMake(819,692,36 ,51) withTag:403];
    [self addAreaButtonToMapAtPoint:CGRectMake(855,692,36 ,51) withTag:358];
    [self addAreaButtonToMapAtPoint:CGRectMake(891,692,36 ,51) withTag:359];
    [self addAreaButtonToMapAtPoint:CGRectMake(928,692,36 ,51) withTag:360];
    [self addAreaButtonToMapAtPoint:CGRectMake(965,692,36 ,51) withTag:361];
    [self addAreaButtonToMapAtPoint:CGRectMake(1002,692,36 ,51) withTag:362];
    [self addAreaButtonToMapAtPoint:CGRectMake(1035,692,36 ,51) withTag:363];
    [self addAreaButtonToMapAtPoint:CGRectMake(1074,692,36 ,51) withTag:364];
    [self addAreaButtonToMapAtPoint:CGRectMake(1113,692,36 ,51) withTag:365];
    [self addAreaButtonToMapAtPoint:CGRectMake(1149,692,36 ,51) withTag:366];
    [self addAreaButtonToMapAtPoint:CGRectMake(1185,692,36 ,51) withTag:367];
    [self addAreaButtonToMapAtPoint:CGRectMake(1221,692,36 ,51) withTag:368];
    [self addAreaButtonToMapAtPoint:CGRectMake(1257,692,36 ,51) withTag:369];
    [self addAreaButtonToMapAtPoint:CGRectMake(1293,692, 36,51) withTag:370];
    [self addAreaButtonToMapAtPoint:CGRectMake(1329,692,36 ,51) withTag:371];
    [self addAreaButtonToMapAtPoint:CGRectMake(1365,692,36 ,51) withTag:372];
    [self addAreaButtonToMapAtPoint:CGRectMake(1401,692,36 ,51) withTag:373];
    [self addAreaButtonToMapAtPoint:CGRectMake(1437,692,36 ,51) withTag:374];
    [self addAreaButtonToMapAtPoint:CGRectMake(1475,692, 36,51) withTag:375];
    [self addAreaButtonToMapAtPoint:CGRectMake(1513,692,36 ,51) withTag:376];
    [self addAreaButtonToMapAtPoint:CGRectMake(1545,692,36 ,51) withTag:377];
    [self addAreaButtonToMapAtPoint:CGRectMake(1581,692,36 ,51) withTag:378];
    [self addAreaButtonToMapAtPoint:CGRectMake(1619,692,36 ,51) withTag:379];
    [self addAreaButtonToMapAtPoint:CGRectMake(1658,692,36 ,51) withTag:380];
    [self addAreaButtonToMapAtPoint:CGRectMake(1694,692,17 ,51) withTag:381];    
    
    // 426 - 425
    [self addAreaButtonToMapAtPoint:CGRectMake(39,742,36,51)   withTag:426];
    [self addAreaButtonToMapAtPoint:CGRectMake(79,742,36,51)   withTag:427];
    [self addAreaButtonToMapAtPoint:CGRectMake(118,742,36,51)   withTag:428];
    [self addAreaButtonToMapAtPoint:CGRectMake(155,742,36,51)  withTag:429];
    [self addAreaButtonToMapAtPoint:CGRectMake(196,742,36,51)  withTag:430];
    [self addAreaButtonToMapAtPoint:CGRectMake(234,742,36,51)  withTag:431];
    [self addAreaButtonToMapAtPoint:CGRectMake(272,742,36,51)  withTag:432];
    [self addAreaButtonToMapAtPoint:CGRectMake(312,742,36,51)  withTag:433];
    [self addAreaButtonToMapAtPoint:CGRectMake(350,742,36,51)  withTag:434];
    [self addAreaButtonToMapAtPoint:CGRectMake(391,742,36,51)  withTag:435];
    [self addAreaButtonToMapAtPoint:CGRectMake(430,742,36,51)  withTag:436];
    [self addAreaButtonToMapAtPoint:CGRectMake(467,742,36,51)  withTag:437];
    [self addAreaButtonToMapAtPoint:CGRectMake(507,742,36,51)  withTag:438];
    [self addAreaButtonToMapAtPoint:CGRectMake(546,742,36,51)  withTag:439];
    [self addAreaButtonToMapAtPoint:CGRectMake(588,742,36,51)  withTag:440];
    [self addAreaButtonToMapAtPoint:CGRectMake(626,742,36,51)  withTag:441];
    [self addAreaButtonToMapAtPoint:CGRectMake(663,742,36,51)  withTag:442];
    [self addAreaButtonToMapAtPoint:CGRectMake(702,742,36,51)  withTag:443];
    [self addAreaButtonToMapAtPoint:CGRectMake(740,742,36,51)  withTag:444];
    [self addAreaButtonToMapAtPoint:CGRectMake(782,742,36,51)  withTag:445];
    [self addAreaButtonToMapAtPoint:CGRectMake(820,742,36,51)  withTag:446];
    [self addAreaButtonToMapAtPoint:CGRectMake(858,742,36,51)  withTag:404];
    [self addAreaButtonToMapAtPoint:CGRectMake(896,742,36,51)  withTag:405];
    [self addAreaButtonToMapAtPoint:CGRectMake(938,742,36,51)  withTag:406];
    [self addAreaButtonToMapAtPoint:CGRectMake(973,742,36,51)  withTag:407];
    [self addAreaButtonToMapAtPoint:CGRectMake(1013,742,36,51)  withTag:408];
    [self addAreaButtonToMapAtPoint:CGRectMake(1051,742,36,51)  withTag:409];
    [self addAreaButtonToMapAtPoint:CGRectMake(1093,742,36,51) withTag:410];
    [self addAreaButtonToMapAtPoint:CGRectMake(1130,742,36,51) withTag:411];
    [self addAreaButtonToMapAtPoint:CGRectMake(1171,742,36,51) withTag:412];
    [self addAreaButtonToMapAtPoint:CGRectMake(1209,742,36,51) withTag:413];
    [self addAreaButtonToMapAtPoint:CGRectMake(1247,742,36,51) withTag:414];
    [self addAreaButtonToMapAtPoint:CGRectMake(1287,742,36,51) withTag:415];
    [self addAreaButtonToMapAtPoint:CGRectMake(1326,742,36,51) withTag:416];
    [self addAreaButtonToMapAtPoint:CGRectMake(1363,742,36,51) withTag:417];
    [self addAreaButtonToMapAtPoint:CGRectMake(1401,742,36,51) withTag:418];
    [self addAreaButtonToMapAtPoint:CGRectMake(1441,742,36,51) withTag:419];
    [self addAreaButtonToMapAtPoint:CGRectMake(1483,742,36,51) withTag:420];
    [self addAreaButtonToMapAtPoint:CGRectMake(1521,742,36,51) withTag:421];
    [self addAreaButtonToMapAtPoint:CGRectMake(1559,742,36,51) withTag:422];
    [self addAreaButtonToMapAtPoint:CGRectMake(1601,742,36,51) withTag:423];
    [self addAreaButtonToMapAtPoint:CGRectMake(1637,742,36,51) withTag:424];
    [self addAreaButtonToMapAtPoint:CGRectMake(1679,742,36,51) withTag:425];
    
    // 466-
    [self addAreaButtonToMapAtPoint:CGRectMake(39,790,17,51)   withTag:466];
    [self addAreaButtonToMapAtPoint:CGRectMake(62,790,40,51)   withTag:467];
    [self addAreaButtonToMapAtPoint:CGRectMake(105,790,40,51)   withTag:468];
    [self addAreaButtonToMapAtPoint:CGRectMake(149,790,40,51)  withTag:469];
    [self addAreaButtonToMapAtPoint:CGRectMake(194,790,40,51)  withTag:470];
    [self addAreaButtonToMapAtPoint:CGRectMake(239,790,40,51)  withTag:471];
    [self addAreaButtonToMapAtPoint:CGRectMake(283,790,40,51)  withTag:472];
    [self addAreaButtonToMapAtPoint:CGRectMake(328,790,40,51)  withTag:473];
    [self addAreaButtonToMapAtPoint:CGRectMake(368,790,40,51)  withTag:474];
    [self addAreaButtonToMapAtPoint:CGRectMake(413,790,40,51)  withTag:475];
    [self addAreaButtonToMapAtPoint:CGRectMake(460,790,40,51)  withTag:476];
    [self addAreaButtonToMapAtPoint:CGRectMake(503,790,40,51)  withTag:477];
    [self addAreaButtonToMapAtPoint:CGRectMake(545,790,40,51)  withTag:478];
    [self addAreaButtonToMapAtPoint:CGRectMake(592,790,40,51)  withTag:479];
    [self addAreaButtonToMapAtPoint:CGRectMake(635,790,40,51)  withTag:480];
    [self addAreaButtonToMapAtPoint:CGRectMake(680,790,40,51)  withTag:481];
    [self addAreaButtonToMapAtPoint:CGRectMake(722,790,40,51)  withTag:482];
    [self addAreaButtonToMapAtPoint:CGRectMake(769,790,40,51)  withTag:483];
    [self addAreaButtonToMapAtPoint:CGRectMake(811,790,40,51)  withTag:484];
    [self addAreaButtonToMapAtPoint:CGRectMake(854,790,40,51)  withTag:447];
    [self addAreaButtonToMapAtPoint:CGRectMake(897,790,40,51)  withTag:448];
    [self addAreaButtonToMapAtPoint:CGRectMake(942,790,40,51)  withTag:449];
    [self addAreaButtonToMapAtPoint:CGRectMake(989,790,40,51)  withTag:450];
    [self addAreaButtonToMapAtPoint:CGRectMake(1033,790,40,51)  withTag:451];
    [self addAreaButtonToMapAtPoint:CGRectMake(1074,790,40,51)  withTag:452];
    [self addAreaButtonToMapAtPoint:CGRectMake(1120,790,40,51)  withTag:453];
    [self addAreaButtonToMapAtPoint:CGRectMake(1163,790,40,51)  withTag:454];
    [self addAreaButtonToMapAtPoint:CGRectMake(1208,790,40,51) withTag:455];
    [self addAreaButtonToMapAtPoint:CGRectMake(1252,790,40,51) withTag:456];
    [self addAreaButtonToMapAtPoint:CGRectMake(1295,790,40,51) withTag:457];
    [self addAreaButtonToMapAtPoint:CGRectMake(1342,790,40,51) withTag:458];
    [self addAreaButtonToMapAtPoint:CGRectMake(1384,790,40,51) withTag:459];
    [self addAreaButtonToMapAtPoint:CGRectMake(1429,790,40,51) withTag:460];
    [self addAreaButtonToMapAtPoint:CGRectMake(1470,790,40,51) withTag:461];
    [self addAreaButtonToMapAtPoint:CGRectMake(1516,790,40,51) withTag:462];
    [self addAreaButtonToMapAtPoint:CGRectMake(1562,790,40,51) withTag:463];
    [self addAreaButtonToMapAtPoint:CGRectMake(1602,790,40,51) withTag:464];
    [self addAreaButtonToMapAtPoint:CGRectMake(1648,790,40,51) withTag:465];
    [self addAreaButtonToMapAtPoint:CGRectMake(1694,790,15,51) withTag:466];    

    // 502-
    [self addAreaButtonToMapAtPoint:CGRectMake(39,840,48,51)   withTag:502];
    [self addAreaButtonToMapAtPoint:CGRectMake(93,840,48,51)   withTag:503];
    [self addAreaButtonToMapAtPoint:CGRectMake(142,840,48,51)   withTag:504];
    [self addAreaButtonToMapAtPoint:CGRectMake(192,840,48,51)  withTag:505];
    [self addAreaButtonToMapAtPoint:CGRectMake(244,840,48,51)  withTag:506];
    [self addAreaButtonToMapAtPoint:CGRectMake(293,840,48,51)  withTag:507];
    [self addAreaButtonToMapAtPoint:CGRectMake(347,840,48,51)  withTag:508];
    [self addAreaButtonToMapAtPoint:CGRectMake(395,840,48,51)  withTag:509];
    [self addAreaButtonToMapAtPoint:CGRectMake(448,840,48,51)  withTag:510];
    [self addAreaButtonToMapAtPoint:CGRectMake(500,840,48,51)  withTag:511];
    [self addAreaButtonToMapAtPoint:CGRectMake(548,840,48,51)  withTag:512];
    [self addAreaButtonToMapAtPoint:CGRectMake(597,840,48,51)  withTag:513];
    [self addAreaButtonToMapAtPoint:CGRectMake(647,840,48,51)  withTag:514];
    [self addAreaButtonToMapAtPoint:CGRectMake(699,840,48,51)  withTag:515];
    [self addAreaButtonToMapAtPoint:CGRectMake(751,840,48,51)  withTag:516];
    [self addAreaButtonToMapAtPoint:CGRectMake(800,840,48,51)  withTag:517];
    [self addAreaButtonToMapAtPoint:CGRectMake(854,840,48,51)  withTag:485];
    [self addAreaButtonToMapAtPoint:CGRectMake(903,840,48,51)  withTag:486];
    [self addAreaButtonToMapAtPoint:CGRectMake(953,840,48,51)  withTag:487];
    [self addAreaButtonToMapAtPoint:CGRectMake(1003,840,48,51)  withTag:488];
    [self addAreaButtonToMapAtPoint:CGRectMake(1054,840,48,51)  withTag:489];
    [self addAreaButtonToMapAtPoint:CGRectMake(1107,840,48,51)  withTag:490];
    [self addAreaButtonToMapAtPoint:CGRectMake(1155,840,48,51)  withTag:491];
    [self addAreaButtonToMapAtPoint:CGRectMake(1208,840,48,51)  withTag:492];
    [self addAreaButtonToMapAtPoint:CGRectMake(1259,840,48,51)  withTag:493];
    [self addAreaButtonToMapAtPoint:CGRectMake(1309,840,48,51)  withTag:494];
    [self addAreaButtonToMapAtPoint:CGRectMake(1359,840,48,51)  withTag:495];
    [self addAreaButtonToMapAtPoint:CGRectMake(1411,840,48,51) withTag:496];
    [self addAreaButtonToMapAtPoint:CGRectMake(1462,840,48,51) withTag:497];
    [self addAreaButtonToMapAtPoint:CGRectMake(1514,840,48,51) withTag:498];
    [self addAreaButtonToMapAtPoint:CGRectMake(1561,840,48,51) withTag:499];
    [self addAreaButtonToMapAtPoint:CGRectMake(1615,840,48,51) withTag:500];
    [self addAreaButtonToMapAtPoint:CGRectMake(1663,840,48,51) withTag:501];
    
    
    // 531-
    [self addAreaButtonToMapAtPoint:CGRectMake(39,889,23,51)   withTag:531];
    [self addAreaButtonToMapAtPoint:CGRectMake(72,889,60,51)   withTag:532];
    [self addAreaButtonToMapAtPoint:CGRectMake(137,889,60,51)   withTag:533];
    [self addAreaButtonToMapAtPoint:CGRectMake(201,889,60,51)  withTag:534];
    [self addAreaButtonToMapAtPoint:CGRectMake(267,889,60,51)  withTag:535];
    [self addAreaButtonToMapAtPoint:CGRectMake(331,889,60,51)  withTag:536];
    [self addAreaButtonToMapAtPoint:CGRectMake(394,889,60,51)  withTag:537];
    [self addAreaButtonToMapAtPoint:CGRectMake(460,889,60,51)  withTag:538];
    [self addAreaButtonToMapAtPoint:CGRectMake(524,889,60,51)  withTag:539];
    [self addAreaButtonToMapAtPoint:CGRectMake(586,889,60,51)  withTag:540];
    [self addAreaButtonToMapAtPoint:CGRectMake(652,889,60,51)  withTag:541];
    [self addAreaButtonToMapAtPoint:CGRectMake(717,889,60,51)  withTag:542];
    [self addAreaButtonToMapAtPoint:CGRectMake(781,889,60,51)  withTag:543];
    [self addAreaButtonToMapAtPoint:CGRectMake(845,889,60,51)  withTag:518];
    [self addAreaButtonToMapAtPoint:CGRectMake(911,889,60,51)  withTag:519];
    [self addAreaButtonToMapAtPoint:CGRectMake(974,889,60,51)  withTag:520];
    [self addAreaButtonToMapAtPoint:CGRectMake(1036,889,60,51)  withTag:521];
    [self addAreaButtonToMapAtPoint:CGRectMake(1106 ,889,60,51)  withTag:522];
    [self addAreaButtonToMapAtPoint:CGRectMake(1168,889,60,51)  withTag:523];
    [self addAreaButtonToMapAtPoint:CGRectMake(1233,889,60,51)  withTag:524];
    [self addAreaButtonToMapAtPoint:CGRectMake(1295,889,60,51)  withTag:525];
    [self addAreaButtonToMapAtPoint:CGRectMake(1361,889,60,51)  withTag:526];
    [self addAreaButtonToMapAtPoint:CGRectMake(1425,889,60,51)  withTag:527];
    [self addAreaButtonToMapAtPoint:CGRectMake(1486,889,60,51)  withTag:528];
    [self addAreaButtonToMapAtPoint:CGRectMake(1556,889,60,51)  withTag:529];
    [self addAreaButtonToMapAtPoint:CGRectMake(1620,889,60,51)  withTag:530];
    [self addAreaButtonToMapAtPoint:CGRectMake(1682,889,23,51)  withTag:531];

    
    
    // 553-
    [self addAreaButtonToMapAtPoint:CGRectMake(39,939,45,51)   withTag:553];
    [self addAreaButtonToMapAtPoint:CGRectMake(90,939,95,51)   withTag:554];
    [self addAreaButtonToMapAtPoint:CGRectMake(180,939,95,51)   withTag:555];
    [self addAreaButtonToMapAtPoint:CGRectMake(272,939,95,51)  withTag:556];
    [self addAreaButtonToMapAtPoint:CGRectMake(364,939,95,51)  withTag:557];
    [self addAreaButtonToMapAtPoint:CGRectMake(458,939,95,51)  withTag:558];
    [self addAreaButtonToMapAtPoint:CGRectMake(552,939,95,51)  withTag:559];
    [self addAreaButtonToMapAtPoint:CGRectMake(646,939,95,51)  withTag:560];
    [self addAreaButtonToMapAtPoint:CGRectMake(739,939,95,51)  withTag:561];
    [self addAreaButtonToMapAtPoint:CGRectMake(831,939,95,51)  withTag:544];
    [self addAreaButtonToMapAtPoint:CGRectMake(923,939,95,51)  withTag:545];
    [self addAreaButtonToMapAtPoint:CGRectMake(1017,939,95,51)  withTag:546];
    [self addAreaButtonToMapAtPoint:CGRectMake(1111,939,95,51)  withTag:547];
    [self addAreaButtonToMapAtPoint:CGRectMake(1201,939,95,51)  withTag:548];
    [self addAreaButtonToMapAtPoint:CGRectMake(1297,939,95,51)  withTag:549];
    [self addAreaButtonToMapAtPoint:CGRectMake(1391,939,95,51)  withTag:550];
    [self addAreaButtonToMapAtPoint:CGRectMake(1483,939,95,51)  withTag:551];
    [self addAreaButtonToMapAtPoint:CGRectMake(1575,939,95,51)  withTag:552];
    [self addAreaButtonToMapAtPoint:CGRectMake(1667,939,43,51)  withTag:553];
    
    
    // 567-
    [self addAreaButtonToMapAtPoint:CGRectMake(39,988,83,51)   withTag:567];
    [self addAreaButtonToMapAtPoint:CGRectMake(120,988,160,51)   withTag:568];
    [self addAreaButtonToMapAtPoint:CGRectMake(290,988,160,51)   withTag:569];
    [self addAreaButtonToMapAtPoint:CGRectMake(461,988,160,51)  withTag:570];
    [self addAreaButtonToMapAtPoint:CGRectMake(623,988,160,51)  withTag:571];
    [self addAreaButtonToMapAtPoint:CGRectMake(791,988,160,51)  withTag:562];
    [self addAreaButtonToMapAtPoint:CGRectMake(960,988,160,51)  withTag:563];
    [self addAreaButtonToMapAtPoint:CGRectMake(1128,988,160,51)  withTag:564];
    [self addAreaButtonToMapAtPoint:CGRectMake(1295,988,160,51)  withTag:565];
    [self addAreaButtonToMapAtPoint:CGRectMake(1463,988,160,51)  withTag:566];
    [self addAreaButtonToMapAtPoint:CGRectMake(1632,988,78,51)  withTag:567];

    

                  // Toolbar buttons
    
    brightnessSlider = [[UISlider alloc] init];
    brightnessSlider.continuous = YES;
   [brightnessSlider setMinimumValue:0.1];
   [brightnessSlider setMaximumValue:1];
    brightnessSlider.value=1;
    
    
    
    
    
    
    
      [brightnessSlider setMinimumTrackImage:[[UIImage imageNamed:@"redslider2.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [brightnessSlider setMaximumTrackImage:[[UIImage imageNamed:@"redslider2.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [brightnessSlider setThumbTintColor:[UIColor darkGrayColor]];
    
    
    [brightnessSlider addTarget:self
                         action:@selector(sliderValueChanged:) 
               forControlEvents:UIControlEventValueChanged];

 nightButton = [[UIBarButtonItem alloc]
                                    initWithImage:[UIImage imageNamed:@"84-lightbulb.png"] style:UIBarButtonItemStylePlain target:self action:@selector(night_clicked:)];


    
    UIBarButtonItem *sliderAsToolbarItem = [[UIBarButtonItem alloc] initWithCustomView:brightnessSlider ];
    [sliderAsToolbarItem setWidth:100.0];
/*
//   Release 1.1
    UIImage *buttonImage = [UIImage imageNamed:@"14-gear.png"];
   settingsButton = [[UIBarButtonItem alloc]

                                    initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(showSettingsScreen)];
 
  self.navigationItem.rightBarButtonItem = settingsButton;

 */

    
    [self setToolbarItems:[NSArray arrayWithObjects:nightButton, sliderAsToolbarItem,     nil]];
    
    [self.navigationController setToolbarHidden:FALSE];
    self.navigationController.toolbarHidden=FALSE;
    // Defaults
    
    
        // Default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat: 1.0 forKey:@"brightness"];
    [defaults synchronize];
    

}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)sv{
    return imgView;
}



-(void) showSettingsScreen {

    
    
    
    
    appSettingsViewController = [[IASKAppSettingsViewController alloc] initWithNibName:@"IASKAppSettingsView" bundle:nil] ;
    appSettingsViewController.delegate = self;
    appSettingsViewController.showDoneButton = YES;
    UINavigationController *aNavController = [[UINavigationController alloc] initWithRootViewController:appSettingsViewController] ;
    [self presentModalViewController:aNavController animated:YES];


}




- (IBAction) sliderValueChanged:(UISlider *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.view.alpha=sender.value;
    BOOL isNight = [defaults boolForKey:@"isNight"];
    if (!isNight) {
    self.navigationController.toolbar.alpha=sender.value;
        self.navigationController.navigationBar.alpha=sender.value;}
        
    [defaults setFloat:sender.value forKey:@"brightness"];
    [defaults synchronize];
}

- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender {
	[self dismissModalViewControllerAnimated:YES];
//	[self reconfigure];
}


// Areabutton toevoegen
-(void)addAreaButtonToMapAtPoint:(CGRect)rect withTag:(NSInteger)areatag{
    UIButton *AreaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [AreaButton.layer setBorderColor:[[UIColor grayColor] CGColor]];







//    [AreaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    


    [AreaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AreaButton.backgroundColor = [UIColor clearColor];
    AreaButton.layer.borderColor = [UIColor blackColor].CGColor;
    AreaButton.layer.borderWidth = 0.5f;
    AreaButton.layer.cornerRadius = 0.0f;
    [AreaButton setTitle: [NSString stringWithFormat:@"%d",areatag] forState: UIControlStateNormal];
    AreaButton.frame = rect;




    [AreaButton addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:AreaButton];
    [AreaButton setTag:areatag];
    [AreaButton setAlpha:0.2];
 	AreaButtonList[areatag] = AreaButton; 	
}



- (void) viewWillAppear:(BOOL)animated {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float brightness=[defaults floatForKey:@"brightness"];
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
    self.navigationController.navigationBar.alpha=brightness;
    BOOL isNight = [defaults boolForKey:@"isNight"];
    if (isNight) [self makeNight];
    if (!isNight) [self makeDay];
    
    
}



- (void)toggleNavBar:(UITapGestureRecognizer *)gesture {
    BOOL barsHidden = self.navigationController.navigationBar.hidden;
    [self.navigationController setNavigationBarHidden:!barsHidden animated:NO];
    [self.navigationController setToolbarHidden:!barsHidden];
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
    NSString *strImageName=@"index.png";
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
    brightnessSlider.value=brightness;
    self.navigationController.toolbar.alpha = brightness;
    self.navigationController.navigationBar.alpha=brightness;
    imgView.image=returnImage;    
    nightButton.tintColor=[self lightnightColor];
    settingsButton.tintColor=[self lightnightColor];

    [defaults setBool:TRUE forKey:@"isNight"];
    [defaults synchronize];
    self.navigationController.navigationBarHidden=TRUE;
    
    
}


-(void) makeDay {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    brightnessSlider.alpha=1.0;
    self.navigationController.toolbar.alpha = 1.0;
    self.navigationController.navigationBar.alpha=1.0;
    NSString *strImageName=@"index.png";
    imgView.image=	[UIImage imageNamed:strImageName];
    [defaults setBool:FALSE forKey:@"isNight"];
    nightButton.tintColor=[UIColor lightGrayColor];
    settingsButton.tintColor=[UIColor lightGrayColor];
    
    [defaults synchronize];
    self.navigationController.navigationBarHidden=FALSE;

}


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

-(IBAction)showHelp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Triatlas Help"
                                                    message:@"Thanks for downloading Triatlas! \n A few hints \n- Single tap on the chart to display full screen (vice versa).\n-Navigate between charts using the black border indicators\n-Use the light bulb to switch on night mode\nApp developed by Norbert Schmidt (c) 2012 DDQ.nl\nTriatlas Charts by Jose R Torres, used with permission."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    
    
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}




@end
