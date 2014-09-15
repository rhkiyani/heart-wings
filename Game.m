//
//  Game.m
//  Heart Wings
//
//  Created by Rizwan Kiyani on 9/12/14.
//  Copyright (c) 2014 Rizwan Kiyani. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(IBAction)StartGame:(id)sender
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenHeight = screenRect.size.height;
    
    //NSLog(@"Height:%d",screenHeight);
    gameOver = false;
    Plane1.hidden = NO;
    Plane2.hidden = NO;
    Plane3.hidden = NO;
    Plane4.hidden = NO;
    StartGame.hidden = YES;
    GameOver.hidden = YES;
    BirdBlack.hidden = YES;
    Arrow.hidden = YES;
    Tap.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlacePlane1];
    [self PlacePlane2];
    [self PlacePlane3];
    [self PlacePlane4];
    
    PlaneMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(PlaneMoving) userInfo:nil repeats:YES];
}

-(void)PlaneMoving
{
    Plane1.center = CGPointMake(Plane1.center.x - 1, Plane1.center.y);
    Plane2.center = CGPointMake(Plane2.center.x - 1, Plane2.center.y);
    Plane3.center = CGPointMake(Plane3.center.x - 1, Plane3.center.y);
    Plane4.center = CGPointMake(Plane4.center.x - 1, Plane4.center.y);
    
    if (Plane1.center.x < -40)
    {
        [self PlacePlane1];
        
    }
    if (Plane2.center.x < -40)
    {
        [self PlacePlane2];
        
    }
    if (Plane3.center.x < -40)
    {
        [self PlacePlane3];
        
    }
    if (Plane4.center.x < -40)
    {
        [self PlacePlane4];
        
    }
    if ((Plane1.center.x == 0) ||
        (Plane2.center.x == 0) ||
        (Plane3.center.x == 0) ||
        (Plane4.center.x == 0))
    {
        [self Score];
        //NSLog(@"score\n");
    }
    
    if (CGRectIntersectsRect(Bird.frame, Plane1.frame) ||
        CGRectIntersectsRect(Bird.frame, Plane2.frame) ||
        CGRectIntersectsRect(Bird.frame, Plane3.frame) ||
        CGRectIntersectsRect(Bird.frame, Plane4.frame))
    {
        [self GameOver];
    }
}

-(void)GameOver
{
    if (ScoreNumber > HighScoreNumber)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [PlaneMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    Bird.hidden = YES;
    GameOver.hidden = NO;
    Plane1.hidden = YES;
    Plane2.hidden = YES;
    Plane3.hidden = YES;
    Plane4.hidden = YES;
    
    gameOver = true;
}

-(void)Score
{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
    AudioServicesPlaySystemSound(CoinSound);
}

-(void)PlacePlane1
{
    RandomPlanePositionX = (arc4random() % 340) + 340;
    RandomPlanePositionY = arc4random() %480;
    
    if ((LastPlanePositionX < RandomPlanePositionX + 25 && LastPlanePositionX > RandomPlanePositionX - 25) &&
        (LastPlanePositionY < RandomPlanePositionY + 25 && LastPlanePositionY > RandomPlanePositionY - 25))
    {
        RandomPlanePositionX = RandomPlanePositionX + 25;
        RandomPlanePositionY = RandomPlanePositionY + 25;
    }
    
    Plane1.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
    
    LastPlanePositionX = RandomPlanePositionX;
    LastPlanePositionY = RandomPlanePositionY;
}

-(void)PlacePlane2
{
    RandomPlanePositionX = (arc4random() % 340) + 340;
    RandomPlanePositionY = arc4random() %480;
    
    if ((LastPlanePositionX < RandomPlanePositionX + 25 && LastPlanePositionX > RandomPlanePositionX - 25) &&
        (LastPlanePositionY < RandomPlanePositionY + 25 && LastPlanePositionY > RandomPlanePositionY - 25))
    {
        RandomPlanePositionX = RandomPlanePositionX + 25;
        RandomPlanePositionY = RandomPlanePositionY + 25;
    }
    
    Plane2.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
    LastPlanePositionX = RandomPlanePositionX;
    LastPlanePositionY = RandomPlanePositionY;
}

-(void)PlacePlane3
{
    RandomPlanePositionX = (arc4random() % 340) + 340;
    RandomPlanePositionY = arc4random() %480;
    
    if ((LastPlanePositionX < RandomPlanePositionX + 25 && LastPlanePositionX > RandomPlanePositionX - 25) &&
        (LastPlanePositionY < RandomPlanePositionY + 25 && LastPlanePositionY > RandomPlanePositionY - 25))
    {
        RandomPlanePositionX = RandomPlanePositionX + 25;
        RandomPlanePositionY = RandomPlanePositionY + 25;
    }
    
    Plane3.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
    LastPlanePositionX = RandomPlanePositionX;
    LastPlanePositionY = RandomPlanePositionY;
}
-(void)PlacePlane4
{
    RandomPlanePositionX = (arc4random() % 340) + 340;
    RandomPlanePositionY = arc4random() %480;
    
    if ((LastPlanePositionX < RandomPlanePositionX + 25 && LastPlanePositionX > RandomPlanePositionX - 25) &&
        (LastPlanePositionY < RandomPlanePositionY + 25 && LastPlanePositionY > RandomPlanePositionY - 25))
    {
        RandomPlanePositionX = RandomPlanePositionX + 25;
        RandomPlanePositionY = RandomPlanePositionY + 25;
    }
    
    Plane4.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
    LastPlanePositionX = RandomPlanePositionX;
    LastPlanePositionY = RandomPlanePositionY;
}
-(void)BirdMoving
{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -30)
    {
        BirdFlight = -15;
    }
    if (Bird.center.y < -10)
    {
        BirdFlight = BirdFlight - 20;
    }
    if (BirdFlight > -15)
    {
        Bird.image = [UIImage imageNamed:@"birdUp.png"];
    }
    if (BirdFlight < -25)
    {
        Bird.image = [UIImage imageNamed:@"birdDown.png"];
    }
    if (Bird.center.y > screenHeight + 10)
    {
        [self GameOver];
    }
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    BirdFlight = 20;
    
    if (!gameOver)
        AudioServicesPlaySystemSound(JumpSound);
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    Plane1.hidden = YES;
    Plane2.hidden = YES;
    Plane3.hidden = YES;
    Plane4.hidden = YES;
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    NSURL *CoinSoundURL = [[NSBundle mainBundle] URLForResource:@"Pickup_Coin15" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)CoinSoundURL, &CoinSound);
    
    NSURL *JumpSoundURL = [[NSBundle mainBundle] URLForResource:@"Jump4" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)JumpSoundURL, &JumpSound);

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
