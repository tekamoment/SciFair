//
//  SFTimes.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFTimes : NSObject

@property (nonatomic, retain) NSMutableDictionary *times;

+ (SFTimes *)cumulativeTimes;

@end
