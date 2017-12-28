//
//  MCQueryEngine.h
//  MagicCubeTimer
//
//  Created by  zcating on 25/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCQueryEngine : NSObject


+(void)select:(NSString *)selection from:(NSString *)table finish:(void(^)(NSArray *array))block;



@end
