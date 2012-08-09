//
//  Person.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/10/12.
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
@property (nonatomic, retain) Times *averageTimes;
@property (nonatomic, retain) Answers *answers;

@end
