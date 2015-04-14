//
//  Human.m
//  dribbble-debuts
//
//  Created by Thanakron Tandavas on 4/15/2558 BE.
//  Copyright (c) 2558 Thanakron Tandavas. All rights reserved.
//

#import "Human.h"

@implementation Human

- (id)initWithPositionX:(CGFloat)posX andPositionX:(CGFloat)posY andHeight:(CGFloat)height
{
    self = [super init];
    if(self) {
        _positionX = posX;
        _positionY = posY;
        _height = height;
    }
    return self;
}

@end
