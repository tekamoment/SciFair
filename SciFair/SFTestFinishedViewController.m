//
//  SFTestFinishedViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestFinishedViewController.h"
#import "SFPerson.h"
#import "SFTimes.h"
#import "Person.h"
#import "Times.h"
#import "Answers.h"
#import "SFAppDelegate.h"

@interface SFTestFinishedViewController ()

@end

@implementation SFTestFinishedViewController
@synthesize managedObjectContext = _managedObjectContext;

- (IBAction)donePressed:(UIButton *)sender {
 
    
    [self commit];
    
    /*
     NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    NSManagedObject *newEntryAnswers = [NSEntityDescription insertNewObjectForEntityForName:@"Answers" inManagedObjectContext:context];
    NSManagedObject *newEntryTimes = [NSEntityDescription insertNewObjectForEntityForName:@"Times" inManagedObjectContext:context];

      
    [newEntry setValue:[[SFPerson testSubject] name] forKey:@"name"];
    [newEntry setValue:[[SFPerson testSubject] gender] forKey:@"gender"];
    [newEntry setValue:[[SFPerson testSubject] year] forKey:@"year"];
    [newEntry setValue:[[SFPerson testSubject] points] forKey:@"points"];
    
    
    void (^addToCoreData)(id, id, BOOL *);
    addToCoreData = ^(id key, id obj, BOOL *stop) {
        //for (NSString *key in [[SFPerson testSubject] answers]) {
            NSString *answer = [[[SFPerson testSubject] answers] objectForKey:key];
            [newEntryAnswers setValue:answer forKey:key];
       // }
    };
    [[[SFPerson testSubject] answers] enumerateKeysAndObjectsUsingBlock:addToCoreData];
    
    void(^addTimesToCoreData)(id, id, BOOL *);
    addTimesToCoreData = ^(id key, id obj, BOOL *stop) {
        NSNumber *time = [[[SFTimes cumulativeTimes] times] objectForKey:key];
        [newEntryTimes setValue:time forKey:key];
    }; // fix to ensure booleans!!!!!!
    [[[SFTimes cumulativeTimes] times] enumerateKeysAndObjectsUsingBlock:addTimesToCoreData];
    
    [newEntry setValue:newEntryAnswers forKey:@"answers"];
    [newEntryAnswers setValue:newEntry forKey:@"answerHolder"];
    [newEntry setValue:newEntryTimes forKey:@"averageTimes"];
    [newEntryTimes setValue:newEntry forKey:@"timeHolder"];
     */
 
#pragma mark iCloud. implement. now.
}

- (void)commit {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSLog(@"%@", context);
    Person *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    newEntry.name = [[SFPerson testSubject] name];
    newEntry.gender = [[SFPerson testSubject] gender];
    newEntry.year = [[SFPerson testSubject] year];
    newEntry.points = [[SFPerson testSubject] points];
    
    Times *newEntryTimes = [NSEntityDescription insertNewObjectForEntityForName:@"Times" inManagedObjectContext:context];
    void(^addTimesToCoreData)(id, id, BOOL *);
    addTimesToCoreData = ^(id key, id obj, BOOL *stop) {
        NSNumber *time = [[[SFTimes cumulativeTimes] times] objectForKey:key];
        [newEntryTimes setValue:time forKey:key];
    }; // fix to ensure booleans!!!!!!
    [[[SFTimes cumulativeTimes] times] enumerateKeysAndObjectsUsingBlock:addTimesToCoreData];
    
    Answers *newEntryAnswers = [NSEntityDescription insertNewObjectForEntityForName:@"Answers" inManagedObjectContext:context];
    
    void (^addToCoreData)(id, id, BOOL *);
    addToCoreData = ^(id key, id obj, BOOL *stop) {
        //for (NSString *key in [[SFPerson testSubject] answers]) {
        NSString *answer = [[[SFPerson testSubject] answers] objectForKey:key];
        [newEntryAnswers setValue:answer forKey:key];
        // }
    };
    [[[SFPerson testSubject] answers] enumerateKeysAndObjectsUsingBlock:addToCoreData];
    
    newEntry.answers = newEntryAnswers;
    newEntryAnswers.answerHolder = newEntry;
    newEntry.averageTimes = newEntryTimes;
    newEntryTimes.timeHolder = newEntry;
    
    NSLog(@"%@, %@, %@.", newEntry, newEntryAnswers, newEntryTimes);
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
    
    if (managedObjectContext == nil)
    {
        managedObjectContext = [(SFAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);
    }
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
