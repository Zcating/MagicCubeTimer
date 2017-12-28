//
//  DeskPattingObserver.m
//  MagicCubeTimer
//
//  Created by  zcating on 25/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "DeskPattingObserver.h"

#import <CoreMotion/CoreMotion.h>

@interface DeskPattingObserver()

@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, assign) CMRotationRate preRate;

@end

@implementation DeskPattingObserver


- (instancetype)init {
    self = [super init];
    if (self) {
        self.enablePattingStop = YES;
        self.motionManager = [[CMMotionManager alloc] init];
        if ([self.motionManager isGyroAvailable]) {
            self.motionManager.gyroUpdateInterval = 0.01;
        }
    }
    return self;
}

- (void)observePattingWithCompletion:(void(^)(void))completion {
    if (self.enablePattingStop == YES) {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [self.motionManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
            // judge the sensitivity
            if ((int)(gyroData.rotationRate.x * 20) != 0 ||(int)(gyroData.rotationRate.y * 20) != 0 || (int)(gyroData.rotationRate.z * 20) != 0) {
                [self.motionManager stopGyroUpdates];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion();
                });
            }
        }];
    }
}
- (void)stopGyro {
    if ([self.motionManager isGyroActive]) {
        [self.motionManager stopGyroUpdates];
    }
}

@end
