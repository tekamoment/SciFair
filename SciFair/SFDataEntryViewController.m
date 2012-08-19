//
//  SFDataEntryViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/5/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFDataEntryViewController.h"
#import "SFPerson.h"

@interface SFDataEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *yearControl;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *testSubjectInfo;
@property (weak, nonatomic) IBOutlet UILabel *particulars;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end

@implementation SFDataEntryViewController
@synthesize textField;
@synthesize genderControl;
@synthesize yearControl;

#pragma mark -
#pragma mark UITextField protocol implementations



- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textField) {
        // Create variables to store this? Create an init for test subject, then call it before segue?
        [[SFPerson testSubject] setName:self.textField.text];
        NSLog(@"The person's name is %@.", [[SFPerson testSubject] name]);
        [theTextField resignFirstResponder];
        NSLog(@"The person's name is %@.", [[SFPerson testSubject] name]);
    }
    return YES;
}
#pragma mark -
#pragma mark Data input -- DONE --

- (void)genderChanged {
    if (self.genderControl.selectedSegmentIndex == 1) [[SFPerson testSubject] setGender:@"Female"];    else [[SFPerson testSubject] setGender:@"Male"];
    NSLog(@"Gender = %@", [[SFPerson testSubject] gender]);
}

- (void)yearChanged {
    switch (self.yearControl.selectedSegmentIndex) {
        case 0:
            [[SFPerson testSubject] setYear:@"7"];
            NSLog(@"Year = 7");
            break;
            
        case 1:
            [[SFPerson testSubject] setYear:@"8"];
            NSLog(@"Year = 8");
            break;
            
        case 2:
            [[SFPerson testSubject] setYear:@"9"];
            NSLog(@"Year = 9");
            break;
            
        case 3:
            [[SFPerson testSubject] setYear:@"10"];
            NSLog(@"Year = 10");
            break;
            
        case 4:
            [[SFPerson testSubject] setYear:@"11"];
            NSLog(@"Year = 11");
            break;
            
        case 5:
            [[SFPerson testSubject] setYear:@"12"];
            NSLog(@"Year = 12");
            break;
            
        case 6:
            [[SFPerson testSubject] setYear:@"Teacher"];
            NSLog(@"Year = Teacher");
            break;
            
        default:
            break;
    }
}

- (IBAction)continuePressed:(UIButton *)sender {
    if (![[SFPerson testSubject] gender] || ![[SFPerson testSubject] name] || ![[SFPerson testSubject] year]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Stuff left!" message:@"You still have stuff to put in." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];    
    } else {
    NSLog(@"Name: %@, Gender: %@, Year: %@.",[[SFPerson testSubject] name], [[SFPerson testSubject] gender], [[SFPerson testSubject] year]);
        [self performSegueWithIdentifier:@"testHelpSegue" sender:self];
    }
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
    [genderControl addTarget:self
                    action:@selector(genderChanged)
          forControlEvents:UIControlEventValueChanged];
    [yearControl addTarget:self
                    action:@selector(yearChanged)
          forControlEvents:UIControlEventValueChanged];
    [self.view sendSubviewToBack:self.backgroundImage];
    self.testSubjectInfo.font = [UIFont fontWithName:@"Cubano" size:70.0];
    self.particulars.font = [UIFont fontWithName:@"Cubano" size:40.0];
    self.genderLabel.font = [UIFont fontWithName:@"Cubano" size:40.0];
    self.levelLabel.font = [UIFont fontWithName:@"Cubano" size:40.0];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setGenderControl:nil];
    [self setYearControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark -
#pragma mark Autorotate to orientation - REMEMBER TO IMPLEMENT IN ALL VC's

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ((interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        return NO;
    } else {
        return YES;
    }
}



@end
