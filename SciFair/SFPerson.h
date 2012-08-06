//
//  SFPerson.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/5/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPerson : NSObject

@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *points;
@property (nonatomic, retain) NSString *year;
@property (nonatomic, retain) NSMutableDictionary *answers;

+ (SFPerson *)testSubject;

@end
