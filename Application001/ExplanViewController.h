//
//  ExplanViewController.h
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ExplanViewController : UIViewController<AVAudioPlayerDelegate>
{
    NSMutableArray *_usefulData1;
    NSMutableArray *_funnyArray;
    NSMutableArray *_useArray;
    NSMutableArray  *_greeArray;

}
@property(nonatomic) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)playAudio:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *myExplanLabel;

@property (nonatomic,assign) int select_num;

@property (nonatomic,assign) int select_button_num;//funny or useful number

@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;

- (IBAction)addFavoriteList:(id)sender;
- (IBAction)slowVoiceBtn:(id)sender;

@end
