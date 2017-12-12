//
//  ColorMatrix.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ColorTag) {
    ColorTagYellow = 0,
    ColorTagWhite,
    ColorTagOrange,
    ColorTagRed,
    ColorTagBlue,
    ColorTagGreen,
};

@interface ColorMatrix : NSObject

@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* yellowSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* whiteSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* orangeSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* redSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* greenSide;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* blueSide;

@property (nonatomic, assign) NSUInteger orderNumber;

@end
