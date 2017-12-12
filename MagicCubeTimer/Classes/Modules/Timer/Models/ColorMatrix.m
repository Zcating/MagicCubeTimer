//
//  ColorMatrix.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "ColorMatrix.h"

@interface ColorMatrix()

@end

@implementation ColorMatrix

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.orderNumber = 3;
    }
    return self;
}

-(NSMutableArray<NSMutableArray<NSNumber *> *> *)yellowSide {
    if (_yellowSide == nil) {
        _yellowSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagYellow;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_yellowSide addObject:obj];
        }
    }
    return _yellowSide;
}

-(NSMutableArray<NSMutableArray<NSNumber *> *> *)whiteSide {
    if (_whiteSide == nil) {
        _whiteSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagWhite;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_whiteSide addObject:obj];
        }
    }
    return _whiteSide;
}

-(NSMutableArray<NSMutableArray<NSNumber *> *> *)orangeSide {
    if (_redSide == nil) {
        _redSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagOrange;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_redSide addObject:obj];
        }
    }
    return _redSide;
}

-(NSMutableArray<NSMutableArray<NSNumber *> *> *)redSide {
    if (_redSide == nil) {
        _redSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagRed;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_redSide addObject:obj];
        }
    }
    return _redSide;
}
-(NSMutableArray<NSMutableArray<NSNumber *> *> *)greenSide {
    if (_greenSide == nil) {
        _greenSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagGreen;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_greenSide addObject:obj];
        }
    }
    return _greenSide;
}
-(NSMutableArray<NSMutableArray<NSNumber *> *> *)blueSide {
    if (_blueSide == nil) {
        _blueSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagBlue;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_blueSide addObject:obj];
        }
    }
    return _blueSide;
}


-(void)rotateRight {
    [self clockwiseRotate:self.redSide];
    [self mapWithmainSide:self.blueSide leftSide:self.yellowSide rightSide:self.whiteSide oppositeSide:self.greenSide];
}

- (void)rotateLeft {
    [self clockwiseRotate:self.orangeSide];
    [self mapWithmainSide:self.greenSide leftSide:self.whiteSide rightSide:self.yellowSide oppositeSide:self.greenSide];
}

- (void)rotateFront {
    [self clockwiseRotate:self.yellowSide];
    [self mapWithmainSide:self. leftSide:<#(NSMutableArray<NSMutableArray<NSNumber *> *> *)#> rightSide:<#(NSMutableArray<NSMutableArray<NSNumber *> *> *)#> oppositeSide:<#(NSMutableArray<NSMutableArray<NSNumber *> *> *)#>]
}


-(void)clockwiseRotate:(NSMutableArray<NSMutableArray<NSNumber *> *> *)side {
    for (size_t y = 0; y < self.orderNumber / 2; y++) {
        for (size_t x = 0; x < self.orderNumber; x++) {
            NSNumber *tmp = side[y][x];
            side[y][x] = side[self.orderNumber - 1 - y][x];
            side[self.orderNumber - 1 - y][x] = tmp;
        }
    }
    
    for (size_t y = 0; y < self.orderNumber - 1; y++) {
        for (size_t x = y + 1; x < self.orderNumber; x++) {
            NSNumber *tmp = side[y][x];
            side[y][x] = side[x][y];
            side[x][y] = tmp;
        }
    }
}

-(void)antiClockwiseRotate:(NSMutableArray<NSMutableArray<NSNumber *> *> *)side {
    for (size_t x = 0; x < self.orderNumber / 2; x++) {
        for (size_t y = 0; y < self.orderNumber; y++) {
            NSNumber *tmp = side[y][x];
            side[y][x] = side[y][self.orderNumber - 1 - x];
            side[y][self.orderNumber - 1 - x] = tmp;
        }
    }
    
    for (size_t y = 0; y < self.orderNumber - 1; y++) {
        for (size_t x = y + 1; x < self.orderNumber; x++) {
            NSNumber *tmp = side[y][x];
            side[y][x] = side[x][y];
            side[x][y] = tmp;
        }
    }
}



-(void)mapWithmainSide:(NSMutableArray<NSMutableArray<NSNumber *> *> *)mainSide
              leftSide:(NSMutableArray<NSMutableArray<NSNumber *> *> *)leftSide
             rightSide:(NSMutableArray<NSMutableArray<NSNumber *> *> *)rightSide
          oppositeSide:(NSMutableArray<NSMutableArray<NSNumber *> *> *)oppsiteSide {
    
}

@end
