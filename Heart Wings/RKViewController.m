//
//  RKViewController.m
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/11/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import "RKViewController.h"
@import GoogleMobileAds;

@interface RKViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

@implementation RKViewController

- (void)viewDidLoad
{
    HighScoreNubmer = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNubmer];
    SwitchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
    
    if (SwitchValue)
    {
        SoundSwitch.on = true;
        SoundSwitchLabel.text = @"On";
    }
    else
    {
        SoundSwitch.on = false;
        SoundSwitchLabel.text = @"Off";
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bannerView.adUnitID = @"ca-app-pub-2099928635048251/9238268313";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (IBAction)switchValueChanged {
    if (SoundSwitch.on) {
        SoundSwitchLabel.text = @"On";
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"ToggleSound"];
        //SwitchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
    }
    else {
        SoundSwitchLabel.text = @"Off";
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"ToggleSound"];
        //SwitchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
    }
    //NSLog(@"Switch %hhd",SwitchValue);
}
@end
