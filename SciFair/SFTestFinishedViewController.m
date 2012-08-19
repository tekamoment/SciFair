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

@interface SFTestFinishedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@end

@implementation SFTestFinishedViewController

@synthesize managedObjectContext = managedObjectContext;

- (IBAction)donePressed:(UIButton *)sender {
 
    
    [self commit];
    [[self navigationController] popToRootViewControllerAnimated:YES];

    
    /*
     NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectmanagedObjectContext:managedObjectContext];
    NSManagedObject *newEntryAnswers = [NSEntityDescription insertNewObjectForEntityForName:@"Answers" inManagedObjectmanagedObjectContext:managedObjectContext];
    NSManagedObject *newEntryTimes = [NSEntityDescription insertNewObjectForEntityForName:@"Times" inManagedObjectmanagedObjectContext:managedObjectContext];

      
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
     
    Person *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.managedObjectContext];
    newEntry.name = [[SFPerson testSubject] name];
    newEntry.gender = [[SFPerson testSubject] gender];
    newEntry.year = [[SFPerson testSubject] year];
    newEntry.points = [[SFPerson testSubject] points];
    newEntry.dateTested = [NSDate date];
    
    [[SFPerson testSubject] setName: nil];
    [[SFPerson testSubject] setGender:nil];
    [[SFPerson testSubject] setYear:nil];
    [[SFPerson testSubject] setPoints:nil];
    
    Times *newEntryTimes = [NSEntityDescription insertNewObjectForEntityForName:@"Times" inManagedObjectContext:app.managedObjectContext];
    void(^addTimesToCoreData)(id, id, BOOL *);
    addTimesToCoreData = ^(id key, id obj, BOOL *stop) {
        NSNumber *time = [[[SFTimes cumulativeTimes] times] objectForKey:key];
        [newEntryTimes setValue:time forKey:key];
    }; // fix to ensure booleans!!!!!!
    [[[SFTimes cumulativeTimes] times] enumerateKeysAndObjectsUsingBlock:addTimesToCoreData];
    
    [[SFTimes cumulativeTimes] setTimes:nil];

    Answers *newEntryAnswers = [NSEntityDescription insertNewObjectForEntityForName:@"Answers" inManagedObjectContext:app.managedObjectContext];
    void (^addToCoreData)(id, id, BOOL *);
    addToCoreData = ^(id key, id obj, BOOL *stop) {
        //for (NSString *key in [[SFPerson testSubject] answers]) {
        if ([key hasSuffix:@"correct"]) {
            NSNumber *booly = [[[SFPerson testSubject] answers] objectForKey:key];
            [newEntryAnswers setValue:booly forKey:key];
        } else {
        NSString *answer = [[[SFPerson testSubject] answers] objectForKey:key];
        [newEntryAnswers setValue:answer forKey:key];
        }
        // }
    };
    [[[SFPerson testSubject] answers] enumerateKeysAndObjectsUsingBlock:addToCoreData];
    [[SFPerson testSubject] setAnswers:nil];
    
    newEntry.answers = newEntryAnswers;
    newEntryAnswers.answerHolder = newEntry;
    newEntry.averageTimes = newEntryTimes;
    newEntryTimes.timeHolder = newEntry;
    
    NSLog(@"%@, %@, %@.", newEntry, newEntryAnswers, newEntryTimes);
    NSError *error = nil;
    NSManagedObjectContext *context = app.managedObjectContext;
    if ([[[context persistentStoreCoordinator] persistentStores] count] > 0) {
        if (![context save:&error]) {
        NSLog(@"Failed save.");
    }
    }
NSLog(@"Sent to cloud.");
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
    app = (SFAppDelegate*)[UIApplication sharedApplication].delegate;
    self.navigationItem.hidesBackButton = YES;
    self.pointsLabel.text = [NSString stringWithFormat:@"%@", [[SFPerson testSubject] points]];
    //self.resultText.text = [NSString stringWithFormat:@"You scored %@ points and took %@ seconds to do so.", [[SFPerson testSubject] points], [[[SFTimes cumulativeTimes] times] objectForKey:@"totalTime"]  ];
}

- (void)viewDidUnload
{
    [self setPointsLabel:nil];
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
