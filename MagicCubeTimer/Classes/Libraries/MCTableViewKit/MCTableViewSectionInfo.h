//
//  MCTableViewSectionInfo.h
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCTableViewCellInfo.h"

@interface MCTableViewSectionInfo : NSObject

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, copy) NSString *headerTitle;

@property (nonatomic, copy) NSString *footerTitle;

+ (instancetype)defaultSection;

+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle;

+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

- (void)addCell:(MCTableViewCellInfo *)cellInfo;

- (void)insertCell:(MCTableViewCellInfo *)cellInfo At:(NSUInteger)index;

- (NSUInteger)cellsCount;

- (MCTableViewCellInfo *)cellAt:(NSUInteger)index;

- (void)removeCellAt:(NSUInteger)index;


@end
