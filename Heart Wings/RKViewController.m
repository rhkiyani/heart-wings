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
    }
    else
    {
        SoundSwitch.on = false;
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bannerView.adUnitID = @"ca-app-pub-2099928635048251/9238268313";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSURL *musicFile = [[NSBundle mainBundle] URLForResource:@"home_bk"
                                               withExtension:@"mp3"];
    backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile
                                                                  error:nil];
    backgroundMusic.numberOfLoops = -1;
    [backgroundMusic play];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    backgroundMusic.delegate = nil;
    [backgroundMusic stop];
    backgroundMusic = nil;
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
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"ToggleSound"];
        SwitchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
        [backgroundMusic play];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"ToggleSound"];
        SwitchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
        [backgroundMusic stop];
    }
    //NSLog(@"Switch %hhd",SwitchValue);
}
@end
