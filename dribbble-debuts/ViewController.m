//
//  ViewController.m
//  dribbble-debuts
//
//  Created by Thanakron Tandavas on 4/15/2558 BE.
//  Copyright (c) 2558 Thanakron Tandavas. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

// Thanks to www.stackoverflow.com/a/3532264/1031955
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

CGFloat screenWidth;
CGFloat screenHeight;

UIImage *human;
NSMutableArray *humanOuterBoundPosition;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get the screen width and height
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    // Set up assets
    [self setUpBackground];
    [self addDribbbleLogo];
    [self setUpHuman];
    [self generateOuterBoundHumans];
}

#pragma mark - Animations

#pragma mark - Assets set up

- (void)setUpBackground
{
    UIImage *bgImage = [UIImage imageNamed:@"bg"];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    bgImageView.image = bgImage;
    [self.view addSubview:bgImageView];
}

- (void)setUpHuman
{
    human = [UIImage imageNamed:@"human"];
    
    // Create a list of position of humans
    humanOuterBoundPosition = [[NSMutableArray alloc] init];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(16, 604)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(162, 601)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(258, 627)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(347, 644)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    [humanOuterBoundPosition addObject:[NSValue valueWithCGPoint:CGPointMake(81, 623)]];
    
}

- (void)addDribbbleLogo
{
    UIImage *dribbleLogo = [UIImage imageNamed:@"dribbble-logo"];
    CGFloat screenCenterX = (screenWidth/2) - (dribbleLogo.size.width/2);
    UIImageView *dribbleLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(screenCenterX,
                                                                                 50,
                                                                                 dribbleLogo.size.width,
                                                                                 dribbleLogo.size.height)];
    dribbleLogoView.image = dribbleLogo;
    
    // Make the image transparent at first in order to fade in
    dribbleLogoView.alpha = 0;
    [self.view addSubview:dribbleLogoView];
    
    // Fade in the image
    [self fadeInImage:dribbleLogoView];
}

- (void)generateOuterBoundHumans
{
    
    // Iterate through the list of positions to generate humans
    for (NSValue *positionObj in humanOuterBoundPosition)
    {
        CGPoint position = positionObj.CGPointValue;
        NSLog(@"x = %f   y = %f", position.x, position.y);
        UIImageView *humanView = [[UIImageView alloc] initWithFrame:CGRectMake(position.x,
                                                                               position.y,
                                                                               human.size.width,
                                                                               human.size.height)];
        humanView.image = human;
        [self.view addSubview:humanView];
    }
}

#pragma mark - Utilities

- (void)fadeInImage:(UIImageView *)imageView
{
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         imageView.alpha = 1.0;
                     } completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
