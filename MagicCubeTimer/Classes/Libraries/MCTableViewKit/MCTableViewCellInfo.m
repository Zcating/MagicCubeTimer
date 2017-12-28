//
//  MCTableViewCellInfo.m
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCTableViewCellInfo.h"

@interface MCTableViewCellInfo()

@end


@implementation MCTableViewCellInfo

+ (instancetype)normalCellForTitle:(NSString *)title content:(NSString *)content accessoryType:(UITableViewCellAccessoryType)type {
    MCTableViewCellInfo *info = [[MCTableViewCellInfo alloc] init];
    info.cellType = MCTableViewCellTypeNormal;
    info.title = title;
    info.content = content;
    info.accessoryType = type;
    return info;
}

+ (instancetype)normalCellForTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)type handler:(void(^)(id))handler {
    return [self normalCellForTitle:title content:@"" accessoryType:type handler:handler];
}

+(instancetype)normalCellForTitle:(NSString *)title content:(NSString *)content accessoryType:(UITableViewCellAccessoryType)type handler:(void(^)(id))handler {
    MCTableViewCellInfo *info = [[MCTableViewCellInfo alloc] init];
    info.cellType = MCTableViewCellTypeNormal;
    info.title = title;
    info.content = content;
    info.handler = handler;
    info.accessoryType = type;
    return info;
}

+(instancetype)switchCellForTitle:(NSString *)title on:(BOOL)on handler:(void(^)(id))handler {
    MCTableViewCellInfo *info = [[MCTableViewCellInfo alloc] init];
    info.cellType = MCTableViewCellTypeSwitch;
    info.title = title;
    info.on = @(on);
    info.handler = handler;
    info.cellHeight = 50;
    return info;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellHeight = 50;
    }
    return self;
}

@end
