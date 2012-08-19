//
//  Answers.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/13/12.
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
@property (nonatomic, retain) NSNumber * answer1correct;
@property (nonatomic, retain) NSNumber * answer2correct;
@property (nonatomic, retain) NSNumber * answer3correct;
@property (nonatomic, retain) NSNumber * answer4correct;
@property (nonatomic, retain) NSNumber * answer5correct;
@property (nonatomic, retain) NSNumber * answer6correct;
@property (nonatomic, retain) NSNumber * answer7correct;
@property (nonatomic, retain) NSNumber * answer8correct;
@property (nonatomic, retain) NSNumber * answer9correct;
@property (nonatomic, retain) NSNumber * answer10correct;
@property (nonatomic, retain) NSNumber * answer11correct;
@property (nonatomic, retain) NSNumber * answer12correct;
@property (nonatomic, retain) NSNumber * answer13correct;
@property (nonatomic, retain) NSNumber * answer14correct;
@property (nonatomic, retain) Person *answerHolder;

@end
