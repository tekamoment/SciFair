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
    NSManagedObjectContext *leContext = self.managedObjectContext;
    NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:leContext];
    [newEntry setValue:[[SFPerson testSubject] name] forKey:@"name"];
    [newEntry setValue:[[SFPerson testSubject] gender] forKey:@"gender"];
    [newEntry setValue:[[SFPerson testSubject] year] forKey:@"year"];
    [newEntry setValue:[[SFPerson testSubject] points] forKey:@"points"];
    
    NSManagedObject *newEntryAnswers = [NSEntityDescription insertNewObjectForEntityForName:@"Answers" inManagedObjectContext:leContext];
    void (^addToCoreData)(id, id, BOOL *);
    addToCoreData = ^(id key, id obj, BOOL *stop) {
        //for (NSString *key in [[SFPerson testSubject] answers]) {
            NSString *answer = [[[SFPerson testSubject] answers] objectForKey:key];
            [newEntryAnswers setValue:answer forKey:key];
       // }
    };
    [[[SFPerson testSubject] answers] enumerateKeysAndObjectsUsingBlock:addToCoreData];
    [newEntry setValue:newEntryAnswers forKey:@"answers"];
    [newEntryAnswers setValue:newEntry forKey:@"answerHolder"];
#pragma mark FINISH ADDING CORE DATA SCHTUFFFFFF (TIMES!!!!)
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
