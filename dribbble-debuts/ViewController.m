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

#define ARC4RANDOM_MAX 0x100000000

@interface ViewController ()

@end

CGFloat screenWidth;
CGFloat screenHeight;

UIImage *humanImage;
UIImage *shadowImage;
NSMutableArray *humanOuterBound;
NSMutableArray *humanMiddleBound;
NSMutableArray *humanInnerBound;

UIImageView *pickedHumanView;
UIImageView *dribbleLogoView;
UIImageView *envelopeAndBallView;

typedef NS_ENUM(NSInteger, viewTag) {
    tagBackgroundView = 1,
    tagPickedHumanView = 2,
    tagDribbbleLogo = 3
};

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
    
    // Delay the animation for 3 second
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [self addDribbbleLogo];
                             [self setUpHuman];
                             [self generateOuterBoundHuman];
                             [self generateMediumBoundHuman];
                             [self generateInnerBoundHuman];
                             [self generatePickedHuman];
                         } completion:^(BOOL finished) {
                             
                         }];
    });

}

#pragma mark - Human set up

- (void)setUpHuman
{
    humanImage = [UIImage imageNamed:@"human"];
    shadowImage = [UIImage imageNamed:@"shadow"];
    
    [self setUpOuterBoundHuman];
    [self setUpMediumBoundHuman];
    [self setUpInnerBoundHuman];
}

- (void)setUpOuterBoundHuman
{
    // Create a list of position of humans
    humanOuterBound = [[NSMutableArray alloc] init];
    
    Human *human = [[Human alloc] initWithPositionX:16 andPositionX:604 andWidth:11];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:81 andPositionX:623 andWidth:16];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:162 andPositionX:601 andWidth:16];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:258 andPositionX:627 andWidth:16];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:347 andPositionX:644 andWidth:17];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:367 andPositionX:380 andWidth:13];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:355 andPositionX:240 andWidth:13];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:57 andPositionX:163 andWidth:11];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:295 andPositionX:162 andWidth:11];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:111 andPositionX:118 andWidth:9];
    [humanOuterBound addObject:human];
    human = [[Human alloc] initWithPositionX:336 andPositionX:127 andWidth:9];
    [humanOuterBound addObject:human];
}

- (void)setUpMediumBoundHuman
{
    // Create a list of position of humans
    humanMiddleBound = [[NSMutableArray alloc] init];
    
    Human *human = [[Human alloc] initWithPositionX:203 andPositionX:550 andWidth:15];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:298 andPositionX:567 andWidth:15];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:344 andPositionX:515 andWidth:14];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:59 andPositionX:537 andWidth:15];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:12 andPositionX:395 andWidth:13];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:30 andPositionX:463 andWidth:14];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:353 andPositionX:442 andWidth:14];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:15 andPositionX:223 andWidth:12];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:-2.5 andPositionX:283 andWidth:12];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:213 andPositionX:200 andWidth:12];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:296 andPositionX:240 andWidth:12];
    [humanMiddleBound addObject:human];
    human = [[Human alloc] initWithPositionX:110 andPositionX:211 andWidth:11];
    [humanMiddleBound addObject:human];
}

- (void)setUpInnerBoundHuman
{
    // Create a list of position of humans
    humanInnerBound = [[NSMutableArray alloc] init];
    
    Human *human = [[Human alloc] initWithPositionX:299 andPositionX:397 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:80 andPositionX:421 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:281 andPositionX:463 andWidth:14];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:135 andPositionX:497 andWidth:14];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:302 andPositionX:314 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:240 andPositionX:269 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:164 andPositionX:259 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:48 andPositionX:346 andWidth:13];
    [humanInnerBound addObject:human];
    human = [[Human alloc] initWithPositionX:88 andPositionX:289 andWidth:13];
    [humanInnerBound addObject:human];
}

- (void)generateOuterBoundHuman
{
    
    // Iterate through the list of positions to generate humans
    for (Human *human in humanOuterBound)
    {
        // Generate an UIImageview for each human with its scale according to width
        NSDictionary *scaledImages = [self scaleHuman:humanImage scaledToWidth:human.width];
        
        // Obtain the scaled human and shadow images from the returned dictionary
        UIImage *scaledHumanImg = [scaledImages objectForKey:@"human"];
        UIImage *scaledShadowImg = [scaledImages objectForKey:@"shadow"];
        
        // Add the scaled shadow to the view (Add the shadow first so that the shadow is behind the human)
        CGFloat shadowPosX = human.positionX + scaledHumanImg.size.width * 0.1;
        CGFloat shadowPosY = human.positionY + scaledHumanImg.size.height * 0.9;
        UIImageView *shadowView = [[UIImageView alloc] initWithFrame:CGRectMake(shadowPosX,
                                                                                shadowPosY,
                                                                                scaledShadowImg.size.width,
                                                                                scaledShadowImg.size.height)];
        shadowView.image = scaledShadowImg;
        [self.view addSubview:shadowView];
        
        // Add the scaled human to the view
        UIImageView *humanView = [[UIImageView alloc] initWithFrame:CGRectMake(human.positionX,
                                                                               -10,
                                                                               scaledHumanImg.size.width,
                                                                               scaledHumanImg.size.height)];
        humanView.image = scaledHumanImg;
        [self.view addSubview:humanView];
        
        // Animate the human fall down effect
        [self fallHumanDown:humanView from:human.positionX to:human.positionY];
    }
}

- (void)generateMediumBoundHuman
{
    // Iterate through the list of positions to generate humans
    for (Human *human in humanMiddleBound)
    {
        // Generate an UIImageview for each human with its scale according to width
        NSDictionary *scaledImages = [self scaleHuman:humanImage scaledToWidth:human.width];
        
        // Obtain the scaled human and shadow images from the returned dictionary
        UIImage *scaledHumanImg = [scaledImages objectForKey:@"human"];
        UIImage *scaledShadowImg = [scaledImages objectForKey:@"shadow"];
        
        // Add the scaled shadow to the view (Add the shadow first so that the shadow is behind the human)
        CGFloat shadowPosX = human.positionX + scaledHumanImg.size.width * 0.1;
        CGFloat shadowPosY = human.positionY + scaledHumanImg.size.height * 0.9;
        UIImageView *shadowView = [[UIImageView alloc] initWithFrame:CGRectMake(shadowPosX,
                                                                                shadowPosY,
                                                                                scaledShadowImg.size.width,
                                                                                scaledShadowImg.size.height)];
        shadowView.image = scaledShadowImg;
        [self.view addSubview:shadowView];
        
        // Add the scaled human to the view
        UIImageView *humanView = [[UIImageView alloc] initWithFrame:CGRectMake(human.positionX,
                                                                               -10,
                                                                               scaledHumanImg.size.width,
                                                                               scaledHumanImg.size.height)];
        // Set the color of the medium bound human
        humanView.image = [scaledHumanImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [humanView setTintColor:UIColorFromRGB(0xECF1F2)];
        
        [self.view addSubview:humanView];
        
        // Animate the human fall down effect
        [self fallHumanDown:humanView from:human.positionX to:human.positionY];
    }
}

- (void)generateInnerBoundHuman
{
    // Iterate through the list of positions to generate humans
    for (Human *human in humanInnerBound)
    {
        // Generate an UIImageview for each human with its scale according to width
        NSDictionary *scaledImages = [self scaleHuman:humanImage scaledToWidth:human.width];
        
        // Obtain the scaled human and shadow images from the returned dictionary
        UIImage *scaledHumanImg = [scaledImages objectForKey:@"human"];
        UIImage *scaledShadowImg = [scaledImages objectForKey:@"shadow"];
        
        // Add the scaled shadow to the view (Add the shadow first so that the shadow is behind the human)
        CGFloat shadowPosX = human.positionX + scaledHumanImg.size.width * 0.1;
        CGFloat shadowPosY = human.positionY + scaledHumanImg.size.height * 0.9;
        UIImageView *shadowView = [[UIImageView alloc] initWithFrame:CGRectMake(shadowPosX,
                                                                                shadowPosY,
                                                                                scaledShadowImg.size.width,
                                                                                scaledShadowImg.size.height)];
        shadowView.image = scaledShadowImg;
        [self.view addSubview:shadowView];
        
        // Add the scaled human to the view
        UIImageView *humanView = [[UIImageView alloc] initWithFrame:CGRectMake(human.positionX,
                                                                               -10,
                                                                               scaledHumanImg.size.width,
                                                                               scaledHumanImg.size.height)];
        // Set the color of the medium bound human
        humanView.image = [scaledHumanImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [humanView setTintColor:UIColorFromRGB(0xF2F6F6)];
        
        [self.view addSubview:humanView];
        
        // Animate the human fall down effect
        [self fallHumanDown:humanView from:human.positionX to:human.positionY];
    }
}

- (void)generatePickedHuman
{
    UIImage *pickedHumanImage = [UIImage imageNamed:@"picked-human"];
    UIImage *pickedHumanShadowImage = [UIImage imageNamed:@"picked-human-shadow"];
    
    // Add the picked human shadow
    UIImageView *pickedHumanShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(179,
                                                                                       407,
                                                                                       pickedHumanShadowImage.size.width,
                                                                                       pickedHumanShadowImage.size.height)];
    pickedHumanShadowView.image = pickedHumanShadowImage;
    pickedHumanShadowView.tag = tagPickedHumanView;
    [self.view addSubview:pickedHumanShadowView];
    
    // Add the picked human
    pickedHumanView = [[UIImageView alloc] initWithFrame:CGRectMake(180,
                                                                                 -10,
                                                                                 pickedHumanImage.size.width,
                                                                                 pickedHumanImage.size.height)];
    
    pickedHumanView.tag = tagPickedHumanView;
    // Set the color of the picked human to grey first
    pickedHumanView.image = [pickedHumanImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [pickedHumanView setTintColor:UIColorFromRGB(0xECF1F2)];
    [self.view addSubview:pickedHumanView];
    
    // Animate the human fall down effect
    [self fallHumanDown:pickedHumanView from:180 to:383];
    
    [self performSelector:@selector(addEnvelope) withObject:nil afterDelay:3.0];
}

#pragma mark - Assets set up

- (void)setUpBackground
{
    UIImage *bgImage = [UIImage imageNamed:@"bg"];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    bgImageView.image = bgImage;
    bgImageView.tag = tagBackgroundView;
    [self.view addSubview:bgImageView];
}

- (void)addDribbbleLogo
{
    UIImage *dribbleLogo = [UIImage imageNamed:@"dribbble-logo"];
    CGFloat screenCenterX = (screenWidth/2) - (dribbleLogo.size.width/2);
    dribbleLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(screenCenterX,
                                                                                 45,
                                                                                 dribbleLogo.size.width,
                                                                                 dribbleLogo.size.height)];
    dribbleLogoView.image = dribbleLogo;
    
    // Set the color of the logo to grey first
    dribbleLogoView.image = [dribbleLogo imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [dribbleLogoView setTintColor:UIColorFromRGB(0xE0E7EA)];
    
    // Make the image transparent at first in order to fade in
    dribbleLogoView.alpha = 0;
    dribbleLogoView.tag = tagDribbbleLogo;
    [self.view addSubview:dribbleLogoView];
    
    // Fade in the image
    [self fadeInImage:dribbleLogoView withDelay:4.0];
}

- (void)addEnvelope
{
    UIImage *envelopeImage = [UIImage imageNamed:@"envelope"];
    envelopeAndBallView = [[UIImageView alloc] initWithFrame:CGRectMake(208,
                                                                                   370,
                                                                                   envelopeImage.size.width / 3,
                                                                                   envelopeImage.size.height / 3)];
    envelopeAndBallView.image = envelopeImage;
    // Make the image transparent at first in order to fade in
    envelopeAndBallView.alpha = 0;
    [self.view addSubview: envelopeAndBallView];
    
    // Fade in the envelope
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         envelopeAndBallView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         // Add the exclamation mark after the envelope show up
                         [self addExclamationMark];
                     }];
}

- (void)addExclamationMark
{
    // Add exclamation mark
    UITextView *exclamationMark = [[UITextView alloc] initWithFrame:CGRectMake(190, 360, 10, 25)];
    [exclamationMark setText:@"!"];
    [exclamationMark setTextColor:UIColorFromRGB(0xECF1F2)];
    [exclamationMark setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:16]];
    [exclamationMark setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:exclamationMark];
    
    // Fade out the exclamation mark after 0.5 second
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             exclamationMark.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [exclamationMark removeFromSuperview];
                             [self transformEnvelopeToDribbbleBall];
                         }];
    });
}

- (void)addThankYouText
{
    // Set up the text
    UILabel *thankYouLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/2) - 95,
                                                                       280,
                                                                       250,
                                                                       24)];
    
    [thankYouLabel setTextColor:UIColorFromRGB(0x1e1e1e)];
    [thankYouLabel setBackgroundColor:[UIColor clearColor]];
    [thankYouLabel setFont:[UIFont fontWithName: @"AvenirNext-Regular" size: 20.0f]];
    [thankYouLabel setText:@"Thank you @kazzheng"];
    [thankYouLabel setAlpha:0];
    [self.view addSubview:thankYouLabel];
    
    UILabel *forPickingMeLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/2) - 71,
                                                                           320,
                                                                           450,
                                                                           20)];
    
    [forPickingMeLabel setTextColor:[UIColor blackColor]];
    [forPickingMeLabel setBackgroundColor:[UIColor clearColor]];
    [forPickingMeLabel setFont:[UIFont fontWithName: @"AvenirNext-UltraLight" size: 16.0f]];
    [forPickingMeLabel setText:@"for the Dribbble invite"];
    [forPickingMeLabel setAlpha:0];
    [self.view addSubview:forPickingMeLabel];
    
    // Fade in the text
    [UIView animateWithDuration:2.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         thankYouLabel.alpha = 1.0;
                     } completion:NULL];
    // Fade in the text
    [UIView animateWithDuration:4.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         forPickingMeLabel.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         // Fade out both text
                         [UIView animateWithDuration:2.0
                                               delay:4.0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              // Fade out all the views except bg to finish the app!
                                              for (UIView *subView in self.view.subviews)
                                              {
                                                  [self fadeOutAllViewsExceptBg:subView];
                                              }
                                          } completion:^(BOOL finished) {
                                              // THE APP IS DONE!
                                          }];
                     }];
}

#pragma mark - Animations

- (void)transformEnvelopeToDribbbleBall
{
    // Resize the envelope to the dribbble ball size
    POPSpringAnimation *resizeEnvelope = [POPSpringAnimation animation];
    resizeEnvelope.property = [POPAnimatableProperty propertyWithName: kPOPViewFrame];
    resizeEnvelope.toValue=[NSValue valueWithCGRect:CGRectMake(envelopeAndBallView.frame.origin.x + 5,
                                                               envelopeAndBallView.frame.origin.y + 1,
                                                               10,
                                                               10)];
    resizeEnvelope.name = @"changeShape";
    resizeEnvelope.delegate = self;
    [envelopeAndBallView pop_addAnimation:resizeEnvelope forKey:@"changeShape"];
    
    // Change the envelope to the dribbble ball
    UIImage *dribbbleBall = [UIImage imageNamed:@"dribbble-ball"];
    envelopeAndBallView.image = dribbbleBall;
    
    // Resize the dribbble ball
    POPBasicAnimation *resizeDribbleBall = [POPBasicAnimation animation];
    resizeDribbleBall.property = [POPAnimatableProperty propertyWithName:kPOPViewBounds];
    resizeDribbleBall.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 15, 15)];
    resizeDribbleBall.duration = 0.7;
    [envelopeAndBallView pop_addAnimation:resizeDribbleBall forKey:@"scaleView"];
    
    // Fade in Dribbble Ball
    POPBasicAnimation *fadeInDribbbleBall = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    fadeInDribbbleBall.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    fadeInDribbbleBall.fromValue = @(0.3);
    fadeInDribbbleBall.toValue = @(1.0);
    [envelopeAndBallView pop_addAnimation:fadeInDribbbleBall forKey:@"fadeInDribbbleBall"];
    
    // Then fade out the dribbble immediately
    POPBasicAnimation *fadeOutDribbbleBall = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    fadeOutDribbbleBall.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    fadeOutDribbbleBall.toValue = @(0.0);
    [envelopeAndBallView pop_addAnimation:fadeOutDribbbleBall forKey:@"fadeOutDribbbleBall"];
    
    // Fade in the color of the logo and the picked human
    [self performSelector:@selector(changeToDribbleColor:) withObject:pickedHumanView afterDelay:0.3];
    [self performSelector:@selector(changeToDribbleColor:) withObject:dribbleLogoView afterDelay:0.7];
    
    // Fade out all other humans
    for (UIView *subView in self.view.subviews)
    {
        [self fadeOutOtherHumanView:subView];
    }
    
    [self addThankYouText];
}

#pragma mark - Utilities

- (void)fadeInImage:(UIImageView *)imageView withDelay:(CGFloat)delay
{
    [UIView animateWithDuration:delay
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         imageView.alpha = 1.0;
                     } completion:NULL];
}

- (void)fadeOutOtherHumanView:(UIView *)view
{
    if (view.tag != tagBackgroundView && view.tag != tagPickedHumanView && view.tag != tagDribbbleLogo)
    {
        // If it's not background view, fade it out.
        [UIView animateWithDuration:2.0
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             view.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [view removeFromSuperview];
                         }];
    }
}

- (void)fadeOutAllViewsExceptBg:(UIView *)view
{
    if (view.tag != tagBackgroundView)
    {
        // If it's not background view, fade it out.
        [UIView animateWithDuration:4.0
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             view.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [view removeFromSuperview];
                         }];
    }
}

- (void)fallHumanDown:(UIImageView *)humanView from:(CGFloat)positionX to:(CGFloat)positionY
{
    float randomDelay = [self getRandomFloatFrom:0.7 to:3.0];
    
    POPBasicAnimation *fallDownAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    fallDownAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fallDownAnimation.duration = randomDelay;
    fallDownAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(positionX + (humanView.frame.size.width/2),
                                                                      positionY + (humanView.frame.size.height/2))];
    [humanView pop_addAnimation:fallDownAnimation forKey:@"fallDown"];
    
    POPBasicAnimation *fadeInAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    fadeInAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    fadeInAnimation.duration = randomDelay * 1.1;
    fadeInAnimation.fromValue = @(0.0);
    fadeInAnimation.toValue = @(1.0);
    [humanView pop_addAnimation:fadeInAnimation forKey:@"fadeIn"];
}

- (NSDictionary *)scaleHuman:(UIImage *)sourceImage scaledToWidth:(float)humanNewWidth
{
    // Get the image scale factor
    float humanOldWidth = sourceImage.size.width;
    float scaleFactor = humanNewWidth / humanOldWidth;
    
    // Scale the human image according to the specify width
    float humanNewHeight = sourceImage.size.height * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(humanNewWidth, humanNewHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, humanNewWidth, humanNewHeight)];
    UIImage *newHumanImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Scale the shadow image according to the scale
    float shadowNewWidth = shadowImage.size.width * scaleFactor;
    float shadowNewHeight = shadowImage.size.height * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(shadowNewWidth, shadowNewHeight));
    [shadowImage drawInRect:CGRectMake(0, 0, shadowNewWidth, shadowNewHeight)];
    UIImage *newShadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Generate a dictionary to return a the scaled human and shadow image
    NSMutableDictionary *humanDict = [NSMutableDictionary dictionaryWithCapacity:2];
    [humanDict setObject:newHumanImage forKey:@"human"];
    [humanDict setObject:newShadowImage forKey:@"shadow"];
    
    return humanDict;
}

- (void)changeToDribbleColor:(UIImageView *)sourceImage
{
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sourceImage.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
                     }completion:nil];
    
    sourceImage.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    sourceImage.tintColor = UIColorFromRGB(0xea4c89);
}

- (float)getRandomFloatFrom:(float)minRange to:(float)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX * (maxRange - minRange)) + minRange;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
