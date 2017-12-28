//
//  MCTableViewCellInfo.h
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MCTableViewCellType) {
    MCTableViewCellTypeNormal,
    MCTableViewCellTypeSwitch,
    MCTableViewCellTypeTextField,
    
};

@interface MCTableViewCellInfo : NSObject


@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) CGFloat cellHeight;

// only switch cell
@property (nonatomic, copy) NSNumber *on;

@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic, assign) MCTableViewCellType cellType;

@property (nonatomic, copy) void (^handler)(id sender);


+ (instancetype)normalCellForTitle:(NSString *)title content:(NSString *)content accessoryType:(UITableViewCellAccessoryType)type;

+ (instancetype)normalCellForTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)type handler:(void(^)(id))handler;

+(instancetype)normalCellForTitle:(NSString *)title content:(NSString *)content accessoryType:(UITableViewCellAccessoryType)type handler:(void(^)(id))handler;

+(instancetype)switchCellForTitle:(NSString *)title on:(BOOL)on handler:(void(^)(id))handler;


@end
