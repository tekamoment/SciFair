//
//  SFTestFinishedViewController.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFAppDelegate.h"

@interface SFTestFinishedViewController : UIViewController {
    SFAppDelegate *app;
}


@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
