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
        self.stepNumber = @15;
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
        for (size_t index = 0; index < self.stepNumber.integerValue; index++) {
            [_steps addObject:@(arc4random_uniform(UINT32_MAX) % 12)];
        }
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
    for (size_t index = 0; index < self.stepNumber.integerValue; index++) {
        [_steps addObject:@(arc4random_uniform(UINT32_MAX) % 12)];
    }
}

#pragma mark - Private
- (NSString *)_map:(NSUInteger)random {
    switch (random) {
        case 0:
            return @"F";
        case 1:
            return @"B";
        case 2:
            return @"U";
        case 3:
            return @"D";
        case 4:
            return @"L";
        case 5:
            return @"R";
        case 6:
            return @"F'";
        case 7:
            return @"B'";
        case 8:
            return @"U'";
        case 9:
            return @"D'";
        case 10:
            return @"L'";
        case 11:
            return @"R'";
        default:
            return @"";
    }
}




@end
