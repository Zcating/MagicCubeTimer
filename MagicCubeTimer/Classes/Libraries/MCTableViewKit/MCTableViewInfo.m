//
//  MCTableViewInfo.m
//  MagicCubeTimer
//
//  Created by  zcating on 21/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCTableViewInfo.h"
#import "NormalCell.h"

static NSString * const NormalCellIdentifier = @"NormalCell";
static NSString * const SwitchCellIdentifier = @"SwitchCell";
static NSString * const EditorCellIdentifier = @"EditorCell";

@interface MCTableViewInfo()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<MCTableViewSectionInfo *> *sections;

@end

@implementation MCTableViewInfo

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super init];
    if (self != nil) {
        _tableView = [[UITableView alloc] initWithFrame:frame style:style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:NormalCellIdentifier bundle:nil] forCellReuseIdentifier:NormalCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:SwitchCellIdentifier bundle:nil] forCellReuseIdentifier:SwitchCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:EditorCellIdentifier bundle:nil] forCellReuseIdentifier:EditorCellIdentifier];
        
        _sections = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark - Public

-(void)addSection:(MCTableViewSectionInfo *)sectionInfo {
    [self.sections addObject:sectionInfo];
}

-(void)removeAllSections {
    [self.sections removeAllObjects];
}




#pragma mark - Table View Delegate

#pragma mark - Cell
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sections[section] cellsCount];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.sections[indexPath.section] cellAt:indexPath.row].cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCTableViewCellInfo *cellInfo = [self.sections[indexPath.section] cellAt:indexPath.row];
    
    switch (cellInfo.cellType) {
        case MCTableViewCellTypeNormal: {
            NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:NormalCellIdentifier];
            cell.titleLabel.text = cellInfo.title;
            cell.contentLabel.text = cellInfo.content;
            cell.accessoryType = cellInfo.accessoryType;
            return cell;
        }
        case MCTableViewCellTypeSwitch: {
            return nil;
        }
        case MCTableViewCellTypeTextField: {
            return nil;
        }
    }
}

#pragma mark - Header
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerHeight;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerTitle;
}

#pragma mark - Footer
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.sections[section].footerHeight;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.sections[section].footerTitle;
}

#pragma mark - Selection Event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MCTableViewCellInfo *info = [self.sections[indexPath.section] cellAt:indexPath.row];
    if (info.handler != nil) {
        info.handler(info);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//
//}

@end
