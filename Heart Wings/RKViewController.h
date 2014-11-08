//
//  RKViewController.h
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/11/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import <UIKit/UIKit.h>
NSInteger HighScoreNubmer;
BOOL SwitchValue;
@interface RKViewController : UIViewController
{
    IBOutlet UILabel *HighScore;
    IBOutlet UILabel *SoundSwitchLabel;
    IBOutlet UIImageView *Bird;
    IBOutlet UISwitch *SoundSwitch;
}
- (IBAction)switchValueChanged;
- (BOOL)prefersStatusBarHidden;
@end
