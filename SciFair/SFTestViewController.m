//
//  SFTestViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestViewController.h"
#import "SFEmotion.h"
// CHECK BNR OBJC BOOK FOR HOW TO USE A TIMER
@interface SFTestViewController ()
@property (nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIImageView *emotionImage;

@end

@implementation SFTestViewController
@synthesize emotionImage;

#pragma mark IB ACTION - BUTTON PRESSED
- (IBAction)buttonPressed:(UIButton *)sender {
    // IMPLEMENT NSTIMER HEREEEE
    NSString *answer = sender.currentTitle;
        // consolidate this if-else? they do practially the same thing.
    if ([answer isEqualToString: [[[SFEmotion emotionsDict] emotionInfo] valueForKey:[self questionEmotionString:currentQuestionIndex]]]) {
        NSLog(@"Yeah!");
        [[[SFPerson testSubject] answers] setValue:answer forKey:[self answerNumberString:currentQuestionIndex]];
        questionsCorrect++;
    } else {
        NSLog(@"Nuh.");
        [[[SFPerson testSubject] answers] setValue:answer forKey:[self answerNumberString:currentQuestionIndex]];
    } if (currentQuestionIndex < 15) {
    currentQuestionIndex++;
    self.emotionImage.image = [[[SFEmotion emotionsDict] emotionInfo] valueForKey:[self questionImageString:currentQuestionIndex]];
    } else {
        NSNumber *score = [NSNumber numberWithInt:questionsCorrect];
        [[SFPerson testSubject] setPoints:score];
        [self performSegueWithIdentifier:@"testFinishedSegue" sender:self];
    }

}

- (NSString *) questionEmotionString:(int)index {
    return [NSString stringWithFormat:@"image%demotion", index];
}

- (NSString *) questionImageString:(int)index {
    return [NSString stringWithFormat:@"image%d", index];
}

- (NSString *) answerNumberString:(int)index {
    return [NSString stringWithFormat:@"answer%d", index];
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
    // timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseTimerCount) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
