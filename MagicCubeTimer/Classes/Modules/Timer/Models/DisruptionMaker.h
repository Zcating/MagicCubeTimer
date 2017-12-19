//
//  DisruptionMaker.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisruptionMaker : NSObject

@property (nonatomic, copy) NSNumber *stepNumber;

@property (nonatomic, strong, readonly) NSArray<NSNumber *> *steps;

- (instancetype)initWithStepNumber:(NSInteger)num;

- (NSString *)readableSteps;

- (void)resetSteps;

@end
