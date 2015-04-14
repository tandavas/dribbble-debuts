//
//  Human.m
//  dribbble-debuts
//
//  Created by Thanakron Tandavas on 4/15/2558 BE.
//  Copyright (c) 2558 Thanakron Tandavas. All rights reserved.
//

#import "Human.h"

@implementation Human

- (id)initWithPositionX:(CGFloat)posX andPositionX:(CGFloat)posY andWidth:(CGFloat)width
{
    self = [super init];
    if(self) {
        _positionX = posX;
        _positionY = posY;
        _width = width;
    }
    return self;
}

@end
