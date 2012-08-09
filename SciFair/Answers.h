//
//  Answers.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/10/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Answers : NSManagedObject

@property (nonatomic, retain) NSString * answer1;
@property (nonatomic, retain) NSString * answer2;
@property (nonatomic, retain) NSString * answer3;
@property (nonatomic, retain) NSString * answer4;
@property (nonatomic, retain) NSString * answer5;
@property (nonatomic, retain) NSString * answer6;
@property (nonatomic, retain) NSString * answer7;
@property (nonatomic, retain) NSString * answer8;
@property (nonatomic, retain) NSString * answer9;
@property (nonatomic, retain) NSString * answer10;
@property (nonatomic, retain) NSString * answer11;
@property (nonatomic, retain) NSString * answer12;
@property (nonatomic, retain) NSString * answer13;
@property (nonatomic, retain) NSString * answer14;
@property (nonatomic, retain) Person *answerHolder;

@end
