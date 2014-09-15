//
//  RKViewController.m
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/11/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import "RKViewController.h"

@interface RKViewController ()

@end

@implementation RKViewController

- (void)viewDidLoad
{
    HighScoreNubmer = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNubmer];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
