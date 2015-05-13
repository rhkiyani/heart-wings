//
//  RKViewController.h
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/11/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NSInteger HighScoreNubmer;
BOOL SwitchValue;
@interface RKViewController : UIViewController<AVAudioPlayerDelegate>
{
    IBOutlet UILabel *HighScore;
    IBOutlet UIImageView *Bird;
    IBOutlet UISwitch *SoundSwitch;
    AVAudioPlayer *backgroundMusic;
}
- (IBAction)switchValueChanged;
- (BOOL)prefersStatusBarHidden;
@end
