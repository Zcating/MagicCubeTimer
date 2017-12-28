//
//  DisruptionMaker.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "DisruptionMaker.h"

@interface DisruptionMaker() {
    NSMutableArray<NSNumber *> *_steps;
}

@end

@implementation DisruptionMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        self.stepNumber = @20;
//        _steps = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithStepNumber:(NSInteger)num {
    self = [super init];
    if (self != nil) {
        self.stepNumber = @(num);
    }
    return self;
}

- (NSArray<NSNumber *> *)steps {
    if (_steps == nil) {
        _steps = [[NSMutableArray alloc] init];
        [self _disrupt];
    }
    return _steps;
}

#pragma mark - Public
- (NSString *)readableSteps {
    NSMutableString *disruptionSteps = [[NSMutableString alloc] initWithCapacity:self.steps.count];
    for (NSNumber *step in self.steps) {
        NSString *string = [self _map:step.integerValue];
        [disruptionSteps appendString:string];
        [disruptionSteps appendString:@" "];
    }
    return disruptionSteps;
}


-(void)resetSteps {
    [_steps removeAllObjects];
    [self _disrupt];
}

#pragma mark - Private

- (NSString *)_map:(NSUInteger)random {
    switch (random) {
        case 0:
            return @"F";
        case 1:
            return @"F2";
        case 2:
            return @"F'";
        case 3:
            return @"B";
        case 4:
            return @"B2";
        case 5:
            return @"B'";
        case 6:
            return @"L";
        case 7:
            return @"L2";
        case 8:
            return @"L'";
        case 9:
            return @"R";
        case 10:
            return @"R2";
        case 11:
            return @"R'";
        case 12:
            return @"U";
        case 13:
            return @"U2";
        case 14:
            return @"U'";
        case 15:
            return @"D";
        case 16:
            return @"D2";
        case 17:
            return @"D'";
            
        default:
            return @"";
    }
}

- (void)_disrupt {
    for (NSUInteger index = 0; index < self.stepNumber.integerValue; index++) {
        NSUInteger cubeCase = 0;
        do {
            cubeCase = arc4random_uniform(6);
//            NSLog(@"step : %@", @(cubeCase));
//            NSLog(@"test : %d", [self _isResonableMove:cubeCase]);
        } while ([self _isResonableMove:cubeCase] == NO);
        [_steps addObject:@(cubeCase)];
    }
    for (NSUInteger index = 0; index < self.stepNumber.integerValue; index++) {
        NSUInteger cubeCase = [_steps[index] integerValue];
        _steps[index] =  @(cubeCase * 3 + arc4random_uniform(3));
    }
}

-(BOOL)_isResonableMove:(NSUInteger)move {
    NSUInteger count = _steps.count;
    if (count == 0) {
        return YES;
    } else if (move != [_steps[count - 1] intValue]) {
        if (count == 1) {
            return YES;
        } else if (move != [_steps[count - 2] intValue] || (move / 2 != [_steps[count - 2] intValue] / 2)) {
            return YES;
        }
    }
    
    return NO;
}

@end
