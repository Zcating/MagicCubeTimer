//
//  MCTableViewInfo.h
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCTableViewSectionInfo.h"
#import "MCTableViewCellInfo.h"

@interface MCTableViewInfo : NSObject

@property (nonatomic, strong, readonly) UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

-(void)addSection:(MCTableViewSectionInfo *)sectionInfo;

-(void)removeAllSections;



@end
