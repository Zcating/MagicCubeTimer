//
//  MCTimer.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCTimer.h"

@interface MCTimer()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) NSTimeInterval currentTimestamp;

@property (nonatomic, copy) void (^block)(NSString *countString, NSTimeInterval time);

@end

@implementation MCTimer

//+(instancetype)main {
//    static MCTimer *timer;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        timer = [[MCTimer alloc] init];
//    });
//    return timer;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)start:(void(^)(NSString *countString, NSTimeInterval time))block {
    _didStart = YES;
    self.currentTimestamp = [NSDate date].timeIntervalSince1970;
    if (@available(iOS 10.0, *)) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
            //        self.timer.fireDate.timeIntervalSinceReferenceDate;
            NSTimeInterval time = self.timer.fireDate.timeIntervalSince1970 - self.currentTimestamp;
            
            int minutes = (int)(time/60);
            int seconds = (time - (minutes * 60));
            int mills = (time - seconds - (minutes * 60)) * 1000;
            NSString *timeString = nil;
            if (minutes == 0) {
                timeString = [NSString stringWithFormat:@"%d.%03d", seconds, mills];
            } else {
                timeString = [NSString stringWithFormat:@"%d:%02d.%03d", minutes, seconds, mills];
            }
            block(timeString, time);
        }];
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timing:) userInfo:nil repeats:YES];
        self.block = block;
    }
}

- (void)timing:(NSTimer *)timer {
    //        self.timer.fireDate.timeIntervalSinceReferenceDate;
    NSTimeInterval time = timer.fireDate.timeIntervalSince1970 - self.currentTimestamp;
    
    int minutes = (int)(time/60);
    int seconds = (time - (minutes * 60));
    int mills = (time - seconds - (minutes * 60)) * 1000;
    NSString *timeString = nil;
    if (minutes == 0) {
        timeString = [NSString stringWithFormat:@"%d.%03d", seconds, mills];
    } else {
        timeString = [NSString stringWithFormat:@"%d:%02d.%03d", minutes, seconds, mills];
    }
    self.block(timeString, time);
}

- (void)stop {
    [self.timer invalidate];
    self.timer = nil;
    _didStart = NO;
}

@end
