//
//  MCTabBarController.m
//  MagicCubeTimer
//
//  Created by  zcating on 11/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCTabBarController.h"
#import "TimerViewController.h"
#import "RecordViewController.h"
#import "SettingViewController.h"
@interface MCTabBarController ()<UITabBarDelegate>

@property (strong, nonatomic) IBOutlet UITabBar *tabBar;

@property (strong, nonatomic, nullable) NSArray<UIViewController *> *viewControllers;

@end

@implementation MCTabBarController

- (instancetype)init {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        UINavigationController *recordController = [[UINavigationController alloc] initWithRootViewController:[[RecordViewController alloc] init]];

        UINavigationController *settingController = [[UINavigationController alloc] initWithRootViewController:[[SettingViewController alloc] init]];

        self.viewControllers = @[[[TimerViewController alloc] init], recordController, settingController];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//
    UINavigationController *recordController = [[UINavigationController alloc] initWithRootViewController:[[RecordViewController alloc] init]];

    UINavigationController *settingController = [[UINavigationController alloc] initWithRootViewController:[[SettingViewController alloc] init]];

    self.viewControllers = @[[[TimerViewController alloc] init], recordController, settingController];
    
    self.tabBar.delegate = self;
    
    self.tabBar.items[0].image = [[UIImage imageNamed:@"tabbar_timer"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[0].selectedImage = [[UIImage imageNamed:@"tabbar_timer_hl"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[0].title = @"计时";
    self.tabBar.items[0].tag = 0;
    
    self.tabBar.items[1].image = [[UIImage imageNamed:@"tabbar_data"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[1].selectedImage = [[UIImage imageNamed:@"tabbar_data_hl"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[1].title = @"数据";
    self.tabBar.items[1].tag = 1;
    
    self.tabBar.items[2].image = [[UIImage imageNamed:@"tabbar_setting"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[2].selectedImage = [[UIImage imageNamed:@"tabbar_setting_hl"] scaleToSize:CGSizeMake(30, 30)];
    self.tabBar.items[2].title = @"设置";
    self.tabBar.items[2].tag = 2;
    
    self.tabBar.selectedItem = self.tabBar.items[0];
    
    for (UIViewController *viewController in self.viewControllers) {
        viewController.tabBarItem = self.tabBar.items[0];
    }
    [self addSelectedViewController:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addSelectedViewController:(NSUInteger)index {
//    [self.view addSubview:self.viewControllers[index].view];
    [self.view insertSubview:self.viewControllers[index].view belowSubview:self.tabBar];
//    [self.view bringSubviewToFront:self.tabBar];
}

#pragma mark - Tab Bar Delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self addSelectedViewController:item.tag];
}


@end
