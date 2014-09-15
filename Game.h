//
//  Game.h
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/12/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

int BirdFlight;
int RandomPlanePositionX;
int RandomPlanePositionY;
int ScoreNumber;
int screenHeight;
int LastPlanePositionX;
int LastPlanePositionY;
bool gameOver;

NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIImageView *Plane1;
    IBOutlet UIImageView *Plane2;
    IBOutlet UIImageView *Plane3;
    IBOutlet UIImageView *Plane4;
    IBOutlet UIImageView *Tap;
    IBOutlet UIImageView *BirdBlack;
    IBOutlet UIImageView *Arrow;
    IBOutlet UIButton *StartGame;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *GameOver;
    
    NSTimer *BirdMovement;
    NSTimer *PlaneMovement;
    
    SystemSoundID CoinSound;
    SystemSoundID JumpSound;
}
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)PlaneMoving;
-(void)PlacePlane1;
-(void)PlacePlane2;
-(void)PlacePlane3;
-(void)PlacePlane4;
-(void)Score;
-(void)GameOver;
-(BOOL)prefersStatusBarHidden;
@end
