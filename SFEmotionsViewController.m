//
//  SFEmotionsViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/12/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFEmotionsViewController.h"

@interface SFEmotionsViewController ()

@end

@implementation SFEmotionsViewController

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
    self.navigationItem.backBarButtonItem.title = @"Main Menu";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
