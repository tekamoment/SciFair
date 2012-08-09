//
//  SFPerson.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/5/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFPerson.h"

static SFPerson *testSubject;

@implementation SFPerson

+ (SFPerson *)testSubject{
    if (!testSubject) {
        testSubject = [[SFPerson alloc] init];
        NSMutableDictionary *holder = [NSMutableDictionary dictionaryWithCapacity:15];
        [testSubject setAnswers:holder];
    }
    return testSubject;
}



@end
