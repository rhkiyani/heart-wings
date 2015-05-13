//
//  Game.h
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/12/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

int BirdFlight;
float RandomPlanePositionX;
float RandomPlanePositionY;
int ScoreNumber;
int plane1;
int screenHeight;
int screenWidth;
float LastPlanePositionX;
float LastPlanePositionY;
bool gameOver;
int planeMovement1;
int wheelMovement;

NSInteger HighScoreNumber;
BOOL ToggleSwitch;

@interface Game : UIViewController<AVAudioPlayerDelegate>
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIImageView *Plane1;
    IBOutlet UIImageView *Plane2;
    IBOutlet UIImageView *Plane3;
    IBOutlet UIImageView *Plane4;
    IBOutlet UIImageView *Alien1;
    IBOutlet UIImageView *Alien2;
    IBOutlet UIImageView *Alien3;
    IBOutlet UIImageView *Wheel;
    IBOutlet UIImageView *Tap;
    IBOutlet UIImageView *BirdBlack;
    IBOutlet UIImageView *Arrow;
    IBOutlet UIButton *StartGame;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *GameOver;
    IBOutlet UILabel *Avoid;
    IBOutlet UILabel *Catch;
    IBOutlet UILabel *Pt1;
    IBOutlet UILabel *Pt2;
    IBOutlet UILabel *Pt5;
    
    NSTimer *BirdMovement;
    NSTimer *PlaneMovement1;
    NSTimer *PlaneMovement2;
    NSTimer *PlaneMovement3;
    NSTimer *PlaneMovement4;
    NSTimer *AlienMovement1;
    NSTimer *AlienMovement2;
    NSTimer *AlienMovement3;
    NSTimer *WheelMovement;
    
    //SystemSoundID CoinSound;
    SystemSoundID CoinSound2;
    SystemSoundID JumpSound;
    SystemSoundID GameOverSound;
    AVAudioPlayer *backgroundMusic;
    
}
@property(nonatomic, copy) NSString *labelText;

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)PlaneMoving1;
-(void)PlaneMoving2;
-(void)PlaneMoving3;
-(void)PlaneMoving4;
-(void)AlienMoving1;
-(void)AlienMoving2;
-(void)AlienMoving3;
-(void)PlacePlane1;
-(void)PlacePlane2;
-(void)PlacePlane3;
-(void)PlacePlane4;
-(void)PlaceAlien1;
-(void)PlaceAlien2;
-(void)PlaceAlien3;
-(void)PlaceWheel;
-(void)Score;
-(void)GameOver;
-(BOOL)prefersStatusBarHidden;
@end
