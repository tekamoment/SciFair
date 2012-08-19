//
//  SFTestSubjectDetailViewController.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/18/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTestSubjectDetailViewController.h"
#import "Person.h"

@interface SFTestSubjectDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SFTestSubjectDetailViewController

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
    self.navigationItem.title = [NSString stringWithFormat:@"Subject Info - %@", self.testSubject.name];
	self.nameLabel.text = self.testSubject.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNameLabel:nil];
    [super viewDidUnload];
}
@end
