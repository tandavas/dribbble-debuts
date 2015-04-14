//
//  Human.h
//  dribbble-debuts
//
//  Created by Thanakron Tandavas on 4/15/2558 BE.
//  Copyright (c) 2558 Thanakron Tandavas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Human : NSObject

@property (nonatomic, assign) CGFloat positionX;
@property (nonatomic, assign) CGFloat positionY;
@property (nonatomic, assign) CGFloat height;

- (id)initWithPositionX:(CGFloat)posX andPositionX:(CGFloat)posY andHeight:(CGFloat)humanHeight;

@end
