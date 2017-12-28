//
//  RecordViewController.m
//  MagicCubeTimer
//
//  Created by  zcating on 19/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "RecordViewController.h"
#import "CountViewController.h"
#import "MCTableViewKit.h"

@interface RecordViewController ()

@property (nonatomic, strong) MCTableViewInfo *info;

@end

@implementation RecordViewController

- (instancetype)init {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.info = [[MCTableViewInfo alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title = @"记录";
    
    [self.view addSubview:self.info.tableView];
    
    [self initRecordSection];
    
    [self.info.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initRecordSection {
    MCTableViewSectionInfo *sectionInfo = [MCTableViewSectionInfo defaultSection];
    [sectionInfo addCell:[MCTableViewCellInfo normalCellForTitle:@"还原次数" content:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator handler:^(id sender) {
        [self.navigationController pushViewController:[[CountViewController alloc] init] animated:YES];
    }]];
    [sectionInfo addCell:[MCTableViewCellInfo normalCellForTitle:@"最快还原时间" content:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator handler:^(id sender) {
        
    }]];
    
    [sectionInfo addCell:[MCTableViewCellInfo normalCellForTitle:@"最慢还原时间" content:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator handler:^(id sender) {
        
    }]];
    
    [sectionInfo addCell:[MCTableViewCellInfo normalCellForTitle:@"平均还原时间" content:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator handler:^(id sender) {
        
    }]];
    
    
    [self.info addSection:sectionInfo];
    
}

@end
