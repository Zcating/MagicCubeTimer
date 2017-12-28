//
//  DeskPattingObserver.h
//  MagicCubeTimer
//
//  Created by  zcating on 25/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeskPattingObserver : NSObject

@property (nonatomic, assign) BOOL enablePattingStop;

- (instancetype)init;

- (void)observePattingWithCompletion:(void(^)(void))completion;

- (void)stopGyro;
@end
