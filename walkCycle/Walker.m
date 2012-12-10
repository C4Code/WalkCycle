//
//  Walker.m
//  walkCycle
//
//  Created by moi on 12-12-10.
//  Copyright (c) 2012 moi. All rights reserved.
//

#import "Walker.h"

@implementation Walker {
    C4Image *walkA, *walkB, *currentImage;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

-(void)setup {
    walkA = [C4Image animatedImageWithNames:@[@"walk0.png",
             @"walk1.png",
             @"walk2.png",
             @"walk3.png",
             @"walk4.png",
             @"walk5.png",
             @"walk6.png",
             @"walk7.png",
             ]];
    [self addImage:walkA];
    currentImage = walkA;
    [walkA play];
}

-(void)test {
    C4Log(@"test");
}

-(void)touchesBegan {
    [self test];
}

-(void)play {
    [currentImage play];
}

-(void)switchWalkCycle {
    if([currentImage isEqual:walkA]) {
        walkB = [C4Image animatedImageWithNames:@[@"walkB0.png",
                 @"walkB1.png",
                 @"walkB2.png",
                 @"walkB3.png",
                 @"walkB4.png",
                 @"walkB5.png",
                 @"walkB6.png",
                 @"walkB7.png",
                 ]];
        
        [self addImage:walkB];
        currentImage = walkB;

        [walkA stop];
        [walkA removeFromSuperview];
        walkA = nil;
    } else {
        walkA = [C4Image animatedImageWithNames:@[@"walk0.png",
                 @"walk1.png",
                 @"walk2.png",
                 @"walk3.png",
                 @"walk4.png",
                 @"walk5.png",
                 @"walk6.png",
                 @"walk7.png",
                 ]];

        [self addImage:walkA];
        currentImage = walkA;

        [walkB stop];
        [walkB removeFromSuperview];
        walkB = nil;
    }
    [self play];
}
@end