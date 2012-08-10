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
        NSArray *pics = @[ [UIImage imageNamed:@"emohappy@2x.png"], @"Scared", [UIImage imageNamed:@"emosad@2x.png"], @"Thoughtful", [UIImage imageNamed:@"emoangry@2x.png"], @"Tired", [UIImage imageNamed:@"emosleepy@2x.png"], @"Happy", [UIImage imageNamed:@"emothoughtful@2x.png"], @"Angry", [UIImage imageNamed:@"emosurprised@2x.png"], @"Sad", [UIImage imageNamed:@"emohappy@2x.png"], @"Sad", [UIImage imageNamed:@"emohappy@2x.png"], @"Happy", [UIImage imageNamed:@"emohappy@2x.png"], @"Angry", [UIImage imageNamed:@"emohappy@2x.png"], @"Scared", [UIImage imageNamed:@"emohappy@2x.png"], @"Surprised", [UIImage imageNamed:@"emohappy@2x.png"], @"Tired", [UIImage imageNamed:@"emohappy@2x.png"], @"Surprised", [UIImage imageNamed:@"emohappy@2x.png"], @"Thoughtful" ];
        NSArray *emos = @[ @"image1", @"image1Emotion", @"image2", @"image2Emotion", @"image3", @"image3Emotion", @"image4", @"image4Emotion", @"image5", @"image5Emotion", @"image6", @"image6Emotion", @"image7", @"image7Emotion", @"image8", @"image8Emotion", @"image9", @"image9Emotion", @"image10", @"image10Emotion", @"image11", @"image11Emotion", @"image12", @"image12Emotion", @"image13", @"image13Emotion", @"image14", @"image14Emotion" ];
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
