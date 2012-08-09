//
//  SFTimes.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFTimes.h"

static SFTimes *cumulativeTimes;

@implementation SFTimes

+ (SFTimes *)cumulativeTimes {
    if (!cumulativeTimes) {
        cumulativeTimes = [[SFTimes alloc] init];
        NSMutableDictionary *holder = [NSMutableDictionary dictionaryWithCapacity:15];
        [cumulativeTimes setTimes:holder];
    }
    return cumulativeTimes;
}

@end
