//
//  DisruptionMaker.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "DisruptionMaker.h"

@interface DisruptionMaker()

// clockwise
@property (nonatomic, strong, readonly) NSString *front;
@property (nonatomic, strong, readonly) NSString *back;
@property (nonatomic, strong, readonly) NSString *up;
@property (nonatomic, strong, readonly) NSString *down;
@property (nonatomic, strong, readonly) NSString *left;
@property (nonatomic, strong, readonly) NSString *right;

// anti-clockwise
@property (nonatomic, strong, readonly) NSString *contraFront;
@property (nonatomic, strong, readonly) NSString *contraBack;
@property (nonatomic, strong, readonly) NSString *contraUp;
@property (nonatomic, strong, readonly) NSString *contraDown;
@property (nonatomic, strong, readonly) NSString *contraLeft;
@property (nonatomic, strong, readonly) NSString *contraRight;


@end

@implementation DisruptionMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        _front  = @"F";
        _back   = @"B";
        _up     = @"U";
        _down   = @"D";
        _left   = @"L";
        _right  = @"R";
        
        _contraFront    = @"F'";
        _contraBack     = @"B'";
        _contraUp       = @"B'";
        _contraDown     = @"D'";
        _contraLeft     = @"L'";
        _contraRight    = @"R'";
    }
    return self;
}

-(NSString *)randomDirection {
    int random = arc4random_uniform(UINT32_MAX) % 12;
    switch (random) {
        case 0:
            return self.front;
        case 1:
            return self.back;
        case 2:
            return self.up;
        case 3:
            return self.down;
        case 4:
            return self.left;
        case 5:
            return self.right;
        case 6:
            return self.contraFront;
        case 7:
            return self.contraBack;
        case 8:
            return self.contraUp;
        case 9:
            return self.contraDown;
        case 10:
            return self.contraLeft;
        case 11:
            return self.contraRight;
        default:
            return @"";
    }
}

-(NSString *)disruptionSteps {
    NSMutableString *disruptionSteps = [[NSMutableString alloc] initWithCapacity:15];
    for (size_t count = 0; count < 15; count++) {
        NSString *string = [self randomDirection];
        [disruptionSteps appendString:string];
        [disruptionSteps appendString:@" "];
    }
    return disruptionSteps;
}


@end
