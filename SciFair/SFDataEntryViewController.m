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

@end

@implementation SFDataEntryViewController
@synthesize textField;

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
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
