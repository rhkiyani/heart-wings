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
    screenWidth = screenRect.size.width;
    planeMovement1 = 0;
    wheelMovement = 0;
    plane1 = 0;
    //NSLog(@"Height:%d",screenHeight);
    gameOver = false;
    Plane1.hidden = YES;
    Plane2.hidden = YES;
    Plane3.hidden = YES;
    Plane4.hidden = YES;
    Alien1.hidden = YES;
    Alien2.hidden = YES;
    Alien3.hidden = YES;
    Wheel.hidden = YES;
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
    [self PlaceAlien1];
    [self PlaceAlien2];
    [self PlaceAlien3];
    [self PlaceWheel];
    
    PlaneMovement1 = [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(PlaneMoving1) userInfo:nil repeats:YES];
    
    PlaneMovement2 = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(PlaneMoving2) userInfo:nil repeats:YES];
    
    PlaneMovement3 = [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(PlaneMoving3) userInfo:nil repeats:YES];
    
    PlaneMovement4 = [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(PlaneMoving4) userInfo:nil repeats:YES];
    
    AlienMovement1 = [NSTimer scheduledTimerWithTimeInterval:0.050 target:self selector:@selector(AlienMoving1) userInfo:nil repeats:YES];
    
    AlienMovement2 = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(AlienMoving2) userInfo:nil repeats:YES];
    
    AlienMovement3 = [NSTimer scheduledTimerWithTimeInterval:0.030 target:self selector:@selector(AlienMoving3) userInfo:nil repeats:YES];
    
    WheelMovement = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(WheelMoving) userInfo:nil repeats:YES];
}

-(void)PlaneMoving1
{
    if (planeMovement1 > 30 & planeMovement1 < 80 + plane1)
    {
        Plane1.center = CGPointMake(Plane1.center.x-1, Plane1.center.y-1);
    }
    else if (planeMovement1 > 160 & planeMovement1 < 210 + plane1)
    {
        Plane1.center = CGPointMake(Plane1.center.x-1, Plane1.center.y+1);
    }
    else if (planeMovement1 > 210 + plane1)
    {
        planeMovement1 = 1;
    }
    else
    {
        Plane1.center = CGPointMake(Plane1.center.x - 1, Plane1.center.y);
    }
    
    
    if (Plane1.center.x < 1.00)
    {
        [self PlacePlane1];
        [self Score];
    }

    if (CGRectIntersectsRect(Bird.frame, Plane1.frame))
    {
        [self GameOver];
    }
    planeMovement1++;
    
}

-(void)PlaneMoving2
{
    Plane2.center = CGPointMake(Plane2.center.x - 1, Plane2.center.y);
    
    if (Plane2.center.x < 1.00)
    {
        [self PlacePlane2];
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Plane2.frame))
    {
        [self GameOver];
    }
}

-(void)PlaneMoving3
{
    Plane3.center = CGPointMake(Plane3.center.x - 1, Plane3.center.y);
    
    if (Plane3.center.x < 1.00)
    {
        [self PlacePlane3];
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Plane3.frame))
    {
        [self GameOver];
    }
}

-(void)PlaneMoving4
{
    Plane4.center = CGPointMake(Plane4.center.x - 1, Plane4.center.y);
    
    if (Plane4.center.x < 1.00)
    {
        [self PlacePlane4];
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Plane4.frame))
    {
        [self GameOver];
    }
}

-(void)AlienMoving1
{
    Alien1.center = CGPointMake(Alien1.center.x - 1, Alien1.center.y);
    
    if (Alien1.center.x < 1.00)
    {
        [self PlaceAlien1];
        [self Score2];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Alien1.frame))
    {
        [self GameOver];
    }
}

-(void)AlienMoving2
{
    Alien2.center = CGPointMake(Alien2.center.x - 1, Alien2.center.y);
    
    if (Alien2.center.x < 1.00)
    {
        [self PlaceAlien2];
        [self Score2];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Alien2.frame))
    {
        [self GameOver];
    }
}
-(void)AlienMoving3
{
    Alien3.center = CGPointMake(Alien3.center.x - 1, Alien3.center.y);
    
    if (Alien3.center.x < 1.00)
    {
        [self PlaceAlien3];
        [self Score2];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Alien3.frame))
    {
        [self GameOver];
    }
}
-(void)WheelMoving
{
    //Wheel.center = CGPointMake(Wheel.center.x - 1, Wheel.center.y);
    
    if (wheelMovement > 1 & wheelMovement < 100)
    {
        Wheel.center = CGPointMake(Wheel.center.x-1, Wheel.center.y-1);
    }
    else if (wheelMovement > 100 & wheelMovement < 200)
    {
        Wheel.center = CGPointMake(Wheel.center.x-1, Wheel.center.y+1);
    }
    else if (wheelMovement > 201)
    {
        wheelMovement = 0;
    }
    else
    {
        Wheel.center = CGPointMake(Wheel.center.x - 1, Wheel.center.y);
    }
    
    if (Wheel.center.x < 1.00)
    {
        [self PlaceWheel];
        //[self Score3];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Wheel.frame))
    {
        [self Score3];
        [self PlaceWheel];
    }
    wheelMovement++;
}
-(void)GameOver
{
    if (ScoreNumber > HighScoreNumber)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [PlaneMovement1 invalidate];
    [PlaneMovement2 invalidate];
    [PlaneMovement3 invalidate];
    [PlaneMovement4 invalidate];
    [AlienMovement1 invalidate];
    [AlienMovement2 invalidate];
    [AlienMovement3 invalidate];
    [WheelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    Bird.hidden = YES;
    GameOver.hidden = NO;
    Plane1.hidden = YES;
    Plane2.hidden = YES;
    Plane3.hidden = YES;
    Plane4.hidden = YES;
    Alien1.hidden = YES;
    Alien2.hidden = YES;
    Alien3.hidden = YES;
    Wheel.hidden = YES;
    
    gameOver = true;
}

-(void)Score
{
    ScoreNumber = ScoreNumber + 1;
 
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
    AudioServicesPlaySystemSound(CoinSound);
}
-(void)Score2
{
    ScoreNumber = ScoreNumber + 2;
    
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
    AudioServicesPlaySystemSound(CoinSound);
}
-(void)Score3
{
    ScoreNumber = ScoreNumber + 5;
    
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
    AudioServicesPlaySystemSound(CoinSound);
}
-(void)PlacePlane1
{
    Plane1.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Plane1.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
    plane1 = plane1 + 10;
    
    if (plane1 > 80)
        plane1 = 0;
    NSLog(@"Plane 1: %i",plane1);
}

-(void)PlacePlane2
{
    Plane2.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Plane2.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}

-(void)PlacePlane3
{
    Plane3.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Plane3.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}

-(void)PlacePlane4
{
    Plane4.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Plane4.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}

-(void)PlaceAlien1
{
    Alien1.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Alien1.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}

-(void)PlaceAlien2
{
    Alien2.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Alien2.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}

-(void)PlaceAlien3
{
    Alien3.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Alien3.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
}
-(void)PlaceWheel
{
    Wheel.hidden = NO;
    RandomPlanePositionX = (arc4random() % screenWidth) + screenWidth;
    RandomPlanePositionY = arc4random() % screenHeight;
    
    Wheel.center = CGPointMake(RandomPlanePositionX, RandomPlanePositionY);
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
    
    ToggleSwitch = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
    
    //NSLog(@"Switch: %hhd",ToggleSwitch);
    
    
    if (ToggleSwitch) {
        if (!gameOver)
            AudioServicesPlaySystemSound(JumpSound);
    }
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
    Alien1.hidden = YES;
    Alien2.hidden = YES;
    Alien3.hidden = YES;
    Wheel.hidden = YES;
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    ToggleSwitch = [[NSUserDefaults standardUserDefaults] boolForKey:@"ToggleSound"];
    
    if (ToggleSwitch)
    {
        NSURL *CoinSoundURL = [[NSBundle mainBundle] URLForResource:@"Pickup_Coin15" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)CoinSoundURL, &CoinSound);
        
        NSURL *JumpSoundURL = [[NSBundle mainBundle] URLForResource:@"Jump4" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)JumpSoundURL, &JumpSound);
    }
    
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
