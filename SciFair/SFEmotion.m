//
//  SFEmotion.m
//  SciFair
//
//  Created by Carlos Arcenas on 8/6/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import "SFEmotion.h"

static SFEmotion *emotionsDict;

@implementation SFEmotion

+ (SFEmotion *)emotionsDict{
    if (!emotionsDict) {
        NSArray *pics = @[ [UIImage imageNamed:@"emohappy@2x.png"], @"Happy" ];
        NSArray *emos = @[ @"image1", @"image1Emotion" ];
        NSDictionary *holder = [[NSDictionary alloc] initWithObjects:pics forKeys:emos];
     emotionsDict = [[SFEmotion alloc] init];
        [emotionsDict setEmotionInfo:holder];

    }
    return emotionsDict;
}

#pragma mark DO NOT DO WHAT I DID BELOW. JUST PUT EVERYTHING IN THE SINGLETON INITIALIZER. PLEASE. I BEG OF THEE.
/*- (id) dictionaryInit {
    //NSArray *pics = @[ [UIImage imageNamed:@"emohappy@2x.png"], @"Happy" ];
    //NSArray *emos = @[ @"image1", @"image1Emotion" ];
    //return[_emotionInfo initWithObjects:pics forKeys:emos];
    return _emotionInfo = [[NSDictionary alloc]initWithObjectsAndKeys:[UIImage imageNamed:@"emohappy@2x.png"], @"image1", @"Happy", @"image1Emotion", nil];
}

//-(id) init {
   // return [self dictionaryInit];
//}
*/

@end
