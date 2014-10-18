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
float RandomPlanePositionX;
float RandomPlanePositionY;
int ScoreNumber;
int screenHeight;
int screenWidth;
float LastPlanePositionX;
float LastPlanePositionY;
bool gameOver;
int planeMovement1;

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
    NSTimer *PlaneMovement1;
    NSTimer *PlaneMovement2;
    NSTimer *PlaneMovement3;
    NSTimer *PlaneMovement4;
    
    SystemSoundID CoinSound;
    SystemSoundID JumpSound;
    
}
@property(nonatomic, copy) NSString *labelText;

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)PlaneMoving1;
-(void)PlaneMoving2;
-(void)PlaneMoving3;
-(void)PlaneMoving4;
-(void)PlacePlane1;
-(void)PlacePlane2;
-(void)PlacePlane3;
-(void)PlacePlane4;
-(void)Score;
-(void)GameOver;
-(BOOL)prefersStatusBarHidden;
@end
