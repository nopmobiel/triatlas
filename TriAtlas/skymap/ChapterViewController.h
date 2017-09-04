//
//  ChapterViewController.h
//  skymap
//
//  Created by Norbert Schmidt on 08-06-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ChapterViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate>{
    IBOutlet UIScrollView *detailScroller;
    IBOutlet UIImageView *imgView;
    int itemTag;
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    NSArray  *kaartArray;
    UISlider *brightnessSlider;
    UIButton* AreaButtonList[20]; 
    UIButton* btnFOV;
    BOOL isMirrored;
    UIBarButtonItem *nightButton;
    UIBarButtonItem *flipButton;
    UIBarButtonItem *mirrorButton;
    UIBarButtonItem *homeButton;

}

@property (nonatomic, retain) IBOutlet UIScrollView *detailScroller;
@property (nonatomic,retain) IBOutlet UIImageView *imgView;
@property (nonatomic,retain) IBOutlet UISlider *brightnessSlider;
@property (nonatomic, retain)  UIBarButtonItem *nightButton;
@property (nonatomic, retain)  UIBarButtonItem *mirrorButton;
@property (nonatomic, retain)  UIBarButtonItem *flipButton;
@property (nonatomic, retain)  UIBarButtonItem *homeButton;

@property (nonatomic, retain) UIButton *btnFOV;
@property(nonatomic,assign) int itemTag;

@property(nonatomic,assign) BOOL isMirrored;

@property(nonatomic) NSArray *kaartArray;

UIImage* rotateUIImage(const UIImage* src, float angleDegrees);

- (IBAction) sliderValueChanged:(id)sender;  
@end
