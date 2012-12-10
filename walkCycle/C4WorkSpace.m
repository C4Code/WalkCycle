//
//  C4WorkSpace.m
//  walkCycle
//
//  Created by moi on 12-11-04.
//  Copyright (c) 2012 moi. All rights reserved.
//

#import "Walker.h"
#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    C4Shape *s;
    C4Image *walkCycle;
    C4Image *mainImage;
    Walker *walker;
}


-(void)setup {
//    CGPoint linePoints[2] = {CGPointMake(384, 0), CGPointMake(384, 1024) };
//    [self.canvas addShape:[C4Shape line:linePoints]];
    
//    mainImage = [C4Image imageNamed:@"C4Sky.png"];
//    mainImage.center = self.canvas.center;
//    [self.canvas addImage:mainImage];

    
    C4Image *walkCycleMask = [C4Image animatedImageWithNames:
                              @[@"walk0.png",
                              @"walk1.png",
                              @"walk2.png",
                              @"walk3.png",
                              @"walk4.png",
                              @"walk5.png",
                              @"walk6.png",
                              @"walk7.png",
                              ]];
    
    
    s = [C4Shape rect:CGRectMake(0,0,55,98)];
    s.fillColor = C4GREY;
    s.lineWidth = 0.0f;
    s.mask = walkCycleMask;
    [walkCycleMask play];

    CGPoint origin = s.origin;
    origin.x = -1*s.width;
    s.origin = CGPointMake(-55,100);
        
    [self.canvas addShape:s];

    walkCycle = [C4Image animatedImageWithNames:@[@"walk0.png",
                 @"walk1.png",
                 @"walk2.png",
                 @"walk3.png",
                 @"walk4.png",
                 @"walk5.png",
                 @"walk6.png",
                 @"walk7.png",
                 ]];
    walkCycle.origin = CGPointMake(-55,300);
    [self.canvas addImage:walkCycle];

    [walkCycle play];
    [self start];

    walker = [[Walker alloc] initWithFrame:CGRectMake(0, 0, 55, 98)];
    
    [self listenFor:@"touchesBegan" fromObject:walker andRunMethod:@"test"];
    [self.canvas addSubview:walker];
//    [self listenFor:@"touchesBegan" fromObject:walkCycle andRunMethod:@"test"];
}

-(void)touchesBegan {
    [walker switchWalkCycle];
}

-(void)test {
    walker.animationDuration = 10.0;
    walker.animationOptions = REPEAT;
    walker.origin = CGPointMake(self.canvas.width,0);
}

-(void)start {
    s.animationDuration = 16.75f;
    s.animationOptions = LINEAR | REPEAT;
    s.origin = CGPointMake(self.canvas.width, s.origin.y);

    walkCycle.animationDuration = 16.75f;
    walkCycle.animationOptions = LINEAR | REPEAT;
    walkCycle.origin = CGPointMake(self.canvas.width, walkCycle.origin.y);
}

@end
