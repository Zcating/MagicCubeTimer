//
//  ColorMatrix.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>


#define CubeRedColor     [UIColor colorWithRed:196/255. green:30/255. blue:58/255. alpha:1]
#define CubeGreenColor   [UIColor colorWithRed:0 green:158/255. blue:96/255. alpha:1]
#define CubeBlueColor    [UIColor colorWithRed:0 green:81/255. blue:186/255. alpha:1]
#define CubeOrangeColor  [UIColor colorWithRed:1 green:88/255. blue:0 alpha:1]
#define CubeYellowColor  [UIColor colorWithRed:1 green:213/255 blue:0 alpha:1]
#define CubeWhiteColor   [UIColor whiteColor]

typedef NS_ENUM(NSUInteger, ColorTag) {
    ColorTagYellow  = 0,
    ColorTagWhite   = 1,
    ColorTagOrange  = 2,
    ColorTagRed     = 3,
    ColorTagBlue    = 4,
    ColorTagGreen   = 5,
};

@interface RectColor :NSObject

@property (nonatomic, assign, readonly) ColorTag colorTag;

@property (nonatomic, strong, readonly) NSString *colorDescription;

@property (nonatomic, strong, readonly) UIColor *color;

@end


@interface ColorMatrix : NSObject

@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* yellowSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* whiteSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* orangeSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* redSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* greenSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* blueSide;

@property (nonatomic, assign) NSUInteger orderNumber;

- (BOOL)didRecover:(NSMutableArray<NSMutableArray<NSNumber*>*>*)side;

- (void)rotationWithSteps:(NSArray<NSNumber *> *)steps;

- (void)reset;

#pragma mark - Left
- (void)rotateLeft;
- (void)contrarotateLeft;

#pragma mark - Right
- (void)rotateRight;
- (void)contrarotateRight;

#pragma mark - Front
- (void)rotateFront;
- (void)contrarotateFront;

#pragma mark - Back
- (void)rotateBack;
- (void)contrarotateBack;

#pragma mark - Up
- (void)rotateUp;
- (void)contrarotateUp;

#pragma mark - Down
- (void)rotateDown;
- (void)contrarotateDown;

@end
