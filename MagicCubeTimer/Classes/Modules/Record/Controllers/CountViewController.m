//
//  CountViewController.m
//  MagicCubeTimer
//
//  Created by  zcating on 24/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "CountViewController.h"
#import "MCTableViewKit.h"

@interface CountViewController ()

@property (nonatomic, strong) MCTableViewInfo *info;

@end

@implementation CountViewController

- (instancetype)init {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.info = [[MCTableViewInfo alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        self.navigationController.title = @"记录";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.info.tableView];
    self.info.tableView.allowsSelection = NO;
    
    MCTableViewSectionInfo *sectionInfo = [[MCTableViewSectionInfo alloc] init];
    for (size_t index = 0; index < 9; index++) {
        NSString *recoverTimes = [NSString stringWithFormat:@"%lu", index + 1];
        [sectionInfo addCell:[MCTableViewCellInfo normalCellForTitle:recoverTimes content:@"" accessoryType:UITableViewCellAccessoryNone]];
    }
    [self.info addSection:sectionInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
