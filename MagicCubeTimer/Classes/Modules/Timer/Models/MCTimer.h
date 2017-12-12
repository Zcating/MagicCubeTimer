//
//  MCTimer.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCTimer : NSObject

@property (readonly) BOOL didStart;

+(instancetype)main;

-(void)start:(void(^)(NSString *countString, NSTimeInterval time))block;

-(void)stop;
@end
