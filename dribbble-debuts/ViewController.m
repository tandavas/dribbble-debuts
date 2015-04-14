//
//  ViewController.m
//  dribbble-debuts
//
//  Created by Thanakron Tandavas on 4/15/2558 BE.
//  Copyright (c) 2558 Thanakron Tandavas. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import "Human.h"

// Thanks to www.stackoverflow.com/a/3532264/1031955
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

CGFloat screenWidth;
CGFloat screenHeight;

UIImage *humanImage;
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
    humanImage = [UIImage imageNamed:@"human"];
    
    // Create a list of position of humans
    humanOuterBoundPosition = [[NSMutableArray alloc] init];
    
    Human *human = [[Human alloc] initWithPositionX:16 andPositionX:604 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:81 andPositionX:623 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:81 andPositionX:623 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:162 andPositionX:601 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:81 andPositionX:623 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:258 andPositionX:627 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:347 andPositionX:644 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    human = [[Human alloc] initWithPositionX:81 andPositionX:623 andHeight:16];
    [humanOuterBoundPosition addObject:human];
    
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
    for (Human *human in humanOuterBoundPosition)
    {
        // Generate an UIImageview for each human with its scale
        UIImageView *humanView = [[UIImageView alloc] initWithFrame:CGRectMake(human.positionX,
                                                                               human.positionY,
                                                                               humanImage.size.width,
                                                                               humanImage.size.height)];
        humanView.image = humanImage;
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
