//
//  Person.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/13/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answers, Times;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * points;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSDate * dateTested;
@property (nonatomic, retain) Answers *answers;
@property (nonatomic, retain) Times *averageTimes;

@end
