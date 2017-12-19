//
//  ColorMatrix.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "ColorMatrix.h"

//@interface RectColor ()
//
//@end
//
//@implementation RectColor
//
//- (instancetype)initWithTag:(ColorTag)tag {
//    self = [super init];
//    if (self) {
//        [self setColorTag:tag];
//    }
//    return self;
//}
//
//-(void)setColorTag:(ColorTag)colorTag {
//    _colorTag = colorTag;
//    switch (colorTag) {
//        case ColorTagRed:
//            _colorDescription = @"Red";
//            _color = CubeRedColor;
//            break;
//        case ColorTagOrange:
//            _colorDescription = @"Orange";
//            _color = CubeOrangeColor;
//            break;
//        case ColorTagBlue:
//            _colorDescription = @"Blue";
//            _color = CubeBlueColor;
//            break;
//        case ColorTagGreen:
//            _colorDescription = @"Green";
//            _color = CubeGreenColor;
//            break;
//        case ColorTagWhite:
//            _colorDescription = @"White";
//            _color = CubeWhiteColor;
//            break;
//        case ColorTagYellow:
//            _colorDescription = @"Yellow";
//            _color = CubeYellowColor;
//            break;
//        default:
//            break;
//    }
//}
//
//-(NSString *)description {
//    return self.colorDescription != nil ? self.colorDescription : @"";
//}
//
//@end


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

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)yellowSide {
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

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)whiteSide {
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

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)orangeSide {
    if (_orangeSide == nil) {
        _orangeSide = [[NSMutableArray alloc] initWithCapacity:self.orderNumber];
        for (size_t index = 0; index < self.orderNumber; index++) {
            ColorTag tag = ColorTagOrange;
            NSMutableArray *obj = [[NSMutableArray alloc] initWithArray:@[@(tag), @(tag), @(tag)]];
            [_orangeSide addObject:obj];
        }
    }
    return _orangeSide;
}

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)redSide {
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
- (NSMutableArray<NSMutableArray<NSNumber *> *> *)greenSide {
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
- (NSMutableArray<NSMutableArray<NSNumber *> *> *)blueSide {
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

- (BOOL)didRecover:(NSMutableArray<NSMutableArray<NSNumber*>*>*)side {
    NSNumber *first = side[0][0];
    for (NSMutableArray *array in side) {
        for (NSNumber *number in array) {
            if ([first isEqualToNumber:number] == NO) {
                return NO;
            }
        }
    }
    return YES;
}

- (void)rotationWithSteps:(NSArray<NSNumber *> *)steps {
    for (NSNumber *step in steps) {
        switch (step.integerValue) {
            case 0:
                [self rotateFront];
                break;
            case 1:
                [self rotateBack];
                break;
            case 2:
                [self rotateUp];
                break;
            case 3:
                [self rotateDown];
                break;
            case 4:
                [self rotateLeft];
                break;
            case 5:
                [self rotateRight];
                break;
            case 6:
                [self contrarotateFront];
                break;
            case 7:
                [self contrarotateBack];
                break;
            case 8:
                [self contrarotateUp];
                break;
            case 9:
                [self contrarotateDown];
                break;
            case 10:
                [self contrarotateLeft];
                break;
            case 11:
                [self contrarotateRight];
                break;
        }
    }
}

- (void)reset {
    _yellowSide = nil;
    _whiteSide = nil;
    _redSide = nil;
    _orangeSide = nil;
    _blueSide = nil;
    _greenSide = nil;
}

#pragma mark - Left

- (void)rotateLeft {
    [self _antiClockwiseRotate:self.orangeSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[index][0] integerValue];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[index][0] = self.yellowSide[index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[index][0] = self.greenSide[index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[index][0] = self.whiteSide[orders - 1 - index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1 - index][orders - 1] = @(tags[index]);
    }
}

- (void)contrarotateLeft {
    [self _clockwiseRotate:self.orangeSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[index][0] integerValue];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[index][0] = self.whiteSide[orders - 1 - index][orders - 1];

    }
    
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1 - index][orders - 1] = self.greenSide[index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[index][0] = self.yellowSide[index][0];
    }

    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[index][0] = @(tags[index]);
    }
}

#pragma mark - Right

- (void)rotateRight {
    [self _clockwiseRotate:self.redSide];
    NSUInteger orders = self.orderNumber;
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[index][orders - 1] integerValue];
    }
    
    // R transform
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[index][orders - 1] = self.whiteSide[index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1 - index][0] = self.greenSide[index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[index][orders - 1] = self.yellowSide[index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[index][orders - 1] = @(tags[index]);
    }
}

- (void)contrarotateRight {
    [self _antiClockwiseRotate:self.redSide];
    NSUInteger orders = self.orderNumber;

    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[index][orders - 1] integerValue];
    }

    for (size_t index = 0;index < orders; index++) {
        self.blueSide[index][orders - 1] = self.yellowSide[index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[index][orders - 1] = self.greenSide[index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[index][orders - 1] = self.whiteSide[orders - 1 - index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1 - index][0] = @(tags[index]);
    }
}

#pragma mark - Front

- (void)rotateFront {
    [self _clockwiseRotate:self.blueSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.yellowSide[orders - 1][index] integerValue];
    }

    // top -> left
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[orders - 1][index] = self.orangeSide[orders - 1][index];
    }

    // left -> down
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[orders - 1][index] = self.whiteSide[orders - 1][index];
    }

    // down -> right
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1][index] = self.redSide[orders - 1][index];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.redSide[orders - 1][index] = @(tags[index]);
    }
}

- (void)contrarotateFront {
    [self _clockwiseRotate:self.blueSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.yellowSide[orders - 1][index] integerValue];
    }
    
    // top -> right
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[orders - 1][index] = self.redSide[orders - 1][index];
    }
    
    // right -> down
    for (size_t index = 0; index < orders; index++) {
        self.redSide[orders - 1][index] = self.whiteSide[orders - 1][index];
    }
    
    // down -> left
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[orders - 1][index] = self.orangeSide[orders - 1][index];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[orders - 1][index] = @(tags[index]);
    }
}

#pragma mark - Back
- (void)rotateBack {
    [self _clockwiseRotate:self.greenSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.yellowSide[0][index] integerValue];
    }
    
    // top -> right
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[0][index] = self.redSide[0][index];
    }
    
    // right -> down
    for (size_t index = 0; index < orders; index++) {
        self.redSide[0][index] = self.whiteSide[0][index];
    }
    
    // down -> left
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[0][index] = self.orangeSide[0][index];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[0][index] = @(tags[index]);
    }
}

- (void)contrarotateBack {
    [self _antiClockwiseRotate:self.greenSide];
    NSUInteger orders = self.orderNumber;
    
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.yellowSide[0][index] integerValue];
    }
    
    // top -> left
    for (size_t index = 0; index < orders; index++) {
        self.yellowSide[0][index] = self.orangeSide[0][index];
    }
    
    // left -> down
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[0][index] = self.whiteSide[0][index];
    }
    
    // down -> right
    for (size_t index = 0; index < orders; index++) {
        self.whiteSide[0][index] = self.redSide[0][index];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.redSide[0][index] = @(tags[index]);
    }
}

#pragma mark - Up
- (void)rotateUp {
    [self _clockwiseRotate:self.yellowSide];
    NSUInteger orders = self.orderNumber;
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[0][index] integerValue];
    }
    
    // front -> left
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[0][index] = self.redSide[orders - 1 - index][0];
    }
    
    // left -> back
    for (size_t index = 0; index < orders; index++) {
        self.redSide[index][0] = self.greenSide[orders - 1][index];
    }
    
    // back -> right
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[orders - 1][index] = self.orangeSide[orders - 1 - index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[index][orders - 1] = @(tags[index]);
    }
}
- (void)contrarotateUp {
    [self _antiClockwiseRotate:self.yellowSide];
    NSUInteger orders = self.orderNumber;
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[0][index] integerValue];
    }
    
    // front -> left
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[0][index] = self.orangeSide[index][orders - 1];
    }
    
    // left -> back
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[index][orders - 1] = self.greenSide[orders - 1][orders - 1 - index];
    }
    
    // back -> right
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[orders - 1][index] = self.redSide[index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.redSide[orders - 1 - index][0] = @(tags[index]);
    }
}

#pragma mark - Down

- (void)rotateDown {
    [self _clockwiseRotate:self.whiteSide];
    NSUInteger orders = self.orderNumber;
    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[orders - 1][index] integerValue];
    }
    
    // front -> left
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[orders - 1][index] = self.orangeSide[index][0];
    }
    
    // left -> back
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[index][0] = self.greenSide[0][orders - 1 - index];
    }
    
    // back -> right
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[0][index] = self.redSide[index][orders - 1];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.redSide[orders - 1 - index][orders - 1] = @(tags[index]);
    }
}

- (void)contrarotateDown {
    [self _antiClockwiseRotate:self.whiteSide];
    NSUInteger orders = self.orderNumber;

    ColorTag tags[orders];
    for (size_t index = 0; index < orders; index++) {
        tags[index] = [self.blueSide[orders - 1][index] integerValue];
    }

    // front -> left
    for (size_t index = 0; index < orders; index++) {
        self.blueSide[orders - 1][index] = self.redSide[orders - 1 - index][orders - 1];
    }

    // left -> back
    for (size_t index = 0; index < orders; index++) {
        self.redSide[index][orders - 1] = self.greenSide[0][index];
    }
    
    // back -> right
    for (size_t index = 0; index < orders; index++) {
        self.greenSide[0][index] = self.orangeSide[orders - 1 - index][0];
    }
    
    for (size_t index = 0; index < orders; index++) {
        self.orangeSide[orders - 1 - index][0] = @(tags[index]);
    }
}

#pragma mark - Private
#pragma mark - Rotate Color Matrix

- (void)_clockwiseRotate:(NSMutableArray<NSMutableArray<NSNumber *> *> *)side {
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

- (void)_antiClockwiseRotate:(NSMutableArray<NSMutableArray<NSNumber *> *> *)side {
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



@end
