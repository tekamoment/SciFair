//
//  SFTestViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestViewController.h"
// CHECK BNR OBJC BOOK FOR HOW TO USE A TIMER
@interface SFTestViewController ()
@property (nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIImageView *emotionImage;

@end

@implementation SFTestViewController
@synthesize emotionImage;

// IB ACTION - BUTTON PRESSED

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
    self.emotionImage.image = [UIImage imageNamed:@"emohappy@2x.png"];
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
