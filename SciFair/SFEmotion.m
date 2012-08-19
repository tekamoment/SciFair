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
        NSArray *pics = @[ [UIImage imageNamed:@"IMG_9720.jpg"], @"Scared", [UIImage imageNamed:@"IMG_9721.jpg"], @"Thoughtful", [UIImage imageNamed:@"IMG_9724.jpg"], @"Tired", [UIImage imageNamed:@"IMG_9727.jpg"], @"Happy", [UIImage imageNamed:@"IMG_9728.jpg"], @"Angry", [UIImage imageNamed:@"IMG_9731.JPG"], @"Sad", [UIImage imageNamed:@"IMG_9732.jpg"], @"Sad", [UIImage imageNamed:@"IMG_9733.jpg"], @"Happy", [UIImage imageNamed:@"IMG_9736.jpg"], @"Angry", [UIImage imageNamed:@"IMG_9740.jpg"], @"Scared", [UIImage imageNamed:@"IMG_9743.jpg"], @"Surprised", [UIImage imageNamed:@"IMG_9745.jpg"], @"Tired", [UIImage imageNamed:@"IMG_9746.jpg"], @"Surprised", [UIImage imageNamed:@"IMG_9747.jpg"], @"Thoughtful" ];
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
