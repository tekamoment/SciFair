//
//  Times.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/5/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Times : NSManagedObject

@property (nonatomic, retain) NSNumber * averageTime;
@property (nonatomic, retain) NSNumber * image1time;
@property (nonatomic, retain) NSNumber * image2time;
@property (nonatomic, retain) NSNumber * image3time;
@property (nonatomic, retain) NSNumber * image4time;
@property (nonatomic, retain) NSNumber * image5time;
@property (nonatomic, retain) Person *newRelationship;

@end
