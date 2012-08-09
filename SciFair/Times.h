//
//  Times.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/9/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Times : NSManagedObject

@property (nonatomic, retain) NSNumber * image14time;
@property (nonatomic, retain) NSNumber * image9time;
@property (nonatomic, retain) NSNumber * image2time;
@property (nonatomic, retain) NSNumber * image3time;
@property (nonatomic, retain) NSNumber * image4time;
@property (nonatomic, retain) NSNumber * image5time;
@property (nonatomic, retain) NSNumber * averageTime;
@property (nonatomic, retain) NSNumber * image1time;
@property (nonatomic, retain) NSNumber * image6time;
@property (nonatomic, retain) NSNumber * image7time;
@property (nonatomic, retain) NSNumber * image8time;
@property (nonatomic, retain) NSNumber * image10time;
@property (nonatomic, retain) NSNumber * image11time;
@property (nonatomic, retain) NSNumber * image12time;
@property (nonatomic, retain) NSNumber * image13time;
@property (nonatomic, retain) Person *timeHolder;

@end
