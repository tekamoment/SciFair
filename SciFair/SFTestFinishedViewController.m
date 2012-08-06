//
//  SFTestFinishedViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestFinishedViewController.h"
#import "SFPerson.h"

@interface SFTestFinishedViewController ()

@end

@implementation SFTestFinishedViewController

- (IBAction)donePressed:(UIButton *)sender {
    NSManagedObjectContext *context = self.managedObjectContext;
    NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    [newEntry setValue:[[SFPerson testSubject] name] forKey:@"name"];
    [newEntry setValue:[[SFPerson testSubject] gender] forKey:@"gender"];
    [newEntry setValue:[[SFPerson testSubject] year] forKey:@"year"];
#pragma mark FINISH ADDING CORE DATA SCHTUFFFFFF
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
    [super viewDidLoad];
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
