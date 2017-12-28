//
//  MCTableViewSectionInfo.m
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCTableViewSectionInfo.h"

@interface MCTableViewSectionInfo()

@property (nonatomic, strong) NSMutableArray<MCTableViewCellInfo *> *cells;


@end

@implementation MCTableViewSectionInfo

+(instancetype)defaultSection {
    return [[MCTableViewSectionInfo alloc] init];
}

+(instancetype)sectionWithHeaderTitle:(NSString *)headerTitle {
    MCTableViewSectionInfo *sectionInfo = [[MCTableViewSectionInfo alloc] init];
    sectionInfo.headerTitle = headerTitle;
    return sectionInfo;
}

+(instancetype)sectionWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle {
    MCTableViewSectionInfo *sectionInfo = [[MCTableViewSectionInfo alloc] init];
    sectionInfo.headerTitle = headerTitle;
    sectionInfo.footerTitle = footerTitle;
    return sectionInfo;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = 0;
        self.footerHeight = 0;
        self.cells = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addCell:(MCTableViewCellInfo *)cellInfo {
    [self.cells addObject:cellInfo];
}

- (void)insertCell:(MCTableViewCellInfo *)cellInfo At:(NSUInteger)index {
    if (self.cells.count >= index) {
        [self.cells addObject:cellInfo];
    }  else {
        [self.cells insertObject:cellInfo atIndex:index];
    }
}

- (NSUInteger)cellsCount {
    return self.cells.count;
}

- (MCTableViewCellInfo *)cellAt:(NSUInteger)index {
    return self.cells[index];
}

- (void)removeCellAt:(NSUInteger)index {
    [self.cells removeObjectAtIndex:index];
}



@end
