//
//  SFViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/4/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    self.backgroundImage.image = [UIImage imageNamed:@"mainbackground@2x.png"];
    // self.navigationItem.title = @"Haiiii!";
    [self.view sendSubviewToBack:self.backgroundImage];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
