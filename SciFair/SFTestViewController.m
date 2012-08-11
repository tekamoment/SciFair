//
//  SFTestViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestViewController.h"
#import "SFPerson.h"
#import "SFEmotion.h"
#import "SFTimes.h"

// CHECK BNR OBJC BOOK FOR HOW TO USE A TIMER
@interface SFTestViewController ()
@property (nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIImageView *emotionImage;
@property (nonatomic, strong) NSNumber *avgTime;

@end

@implementation SFTestViewController
@synthesize emotionImage;

#pragma mark IB ACTION - BUTTON PRESSED
- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *answer = sender.currentTitle;
    if (currentQuestionIndex < 15) {
       if ([answer isEqualToString:[[[SFEmotion emotionsDict] emotionInfo] valueForKey:[self questionEmotionString:currentQuestionIndex]]]) {
        NSLog(@"Yeah!");
        [[[SFPerson testSubject] answers] setValue:answer forKey:[self answerNumberString:currentQuestionIndex]];
        questionsCorrect++;
        [self stopTimer:timer];
    } else {
        NSLog(@"Nuh.");
        [[[SFPerson testSubject] answers] setValue:answer forKey:[self answerNumberString:currentQuestionIndex]];
        [self stopTimer: timer];
    }
    NSLog(@"%d questions correct.", questionsCorrect);
    currentQuestionIndex++;
    self.emotionImage.image = [[[SFEmotion emotionsDict] emotionInfo] valueForKey:[self questionImageString:currentQuestionIndex]];
        [self startTimer];
    } else {
        NSNumber *score = [NSNumber numberWithInt:questionsCorrect];
        [[SFPerson testSubject] setPoints:score];
        [self averageTime];
        [self totalTime];
        [self performSegueWithIdentifier:@"testFinishedSegue" sender:self];
    }

}

#pragma mark Timer methods
- (void)startTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(increaseTimerCount) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)increaseTimerCount {
    timef += 0.01;
}

- (void)stopTimer:(NSTimer *)timeKeeper {
    NSLog(@"It took you %.2f seconds.", timef);
    NSNumber *timens = [NSNumber numberWithFloat:timef];
    [[[SFTimes cumulativeTimes] times] setValue:timens forKey:[self timeNumberString:currentQuestionIndex]];
    [timeKeeper invalidate];
    timef = 0.0;
    //NSLog(@"%@", [[[SFTimes cumulativeTimes] times] description]);
}

- (void)averageTime {
    float tempAvgTime = 0;
    NSString *key;
    for (key in [[SFTimes cumulativeTimes] times]) {
        NSNumber *time = [[[SFTimes cumulativeTimes] times] objectForKey:key];
        float floatTime = [time floatValue];
        tempAvgTime += floatTime;
    }
    
    float realAvgTime = tempAvgTime / 14;
    [self setAvgTime:[NSNumber numberWithFloat:realAvgTime]];
    [[[SFTimes cumulativeTimes] times] setValue:[self avgTime] forKey:@"averageTime"];
}

- (void)totalTime {
    float tempTotalTime = 0;
    NSString *key;
    for (key in [[SFTimes cumulativeTimes] times]) {
        NSNumber *time = [[[SFTimes cumulativeTimes] times] objectForKey:key];
        float floatTime = [time floatValue];
        tempTotalTime += floatTime;
    }
        NSNumber *totalTime = [NSNumber numberWithFloat:tempTotalTime];
        [[[SFTimes cumulativeTimes] times] setValue:totalTime forKey:@"totalTime"];
}


#pragma mark String generation methods
- (NSString *) questionEmotionString:(int)index {
    return [NSString stringWithFormat:@"image%dEmotion", index];
}

- (NSString *) questionImageString:(int)index {
    return [NSString stringWithFormat:@"image%d", index];
}

- (NSString *) answerNumberString:(int)index {
    return [NSString stringWithFormat:@"answer%d", index];
}

- (NSString *) timeNumberString:(int)index {
     return [NSString stringWithFormat:@"image%dtime", index];
}

#pragma mark -

#pragma mark Boilerplate code

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
    [super viewDidLoad];
    self.emotionImage.image = [[[SFEmotion emotionsDict] emotionInfo] valueForKey:@"image1"];
    currentQuestionIndex = 1;
    questionsCorrect = 0;
#pragma mark // Do a "Test begins in..."?
    [self startTimer];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ((interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        return NO;
    } else {
        return YES;
    }
}

@end
