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
        NSArray *pics = @[ [UIImage imageNamed:@"emohappy@2x.png"], @"Happy", [UIImage imageNamed:@"emosad@2x.png"], @"Sad", [UIImage imageNamed:@"emoangry@2x.png"], @"Angry", [UIImage imageNamed:@"emosleepy@2x.png"], @"Sleepy", [UIImage imageNamed:@"emothoughtful@2x.png"], @"Thoughtful", [UIImage imageNamed:@"emosurprised@2x.png"], @"Surprised" ];
        NSArray *emos = @[ @"image1", @"image1Emotion", @"image2", @"image2Emotion", @"image3", @"image3Emotion", @"image4", @"image4Emotion", @"image5", @"image5Emotion", @"image6", @"image6Emotion" ];
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
