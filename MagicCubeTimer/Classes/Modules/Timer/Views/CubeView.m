//
//  CubeView.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "CubeView.h"
#import "SideView.h"

#define YellowTag   0
#define WhiteTag    1
#define OrangeTag   2
#define RedTag      3
#define BlueTag     4
#define GreenTag    5


@interface CubeView()

@property (weak, nonatomic) IBOutlet SideView *yellowView;
@property (weak, nonatomic) IBOutlet SideView *blueView;
@property (weak, nonatomic) IBOutlet SideView *redView;
@property (weak, nonatomic) IBOutlet SideView *whiteView;
@property (weak, nonatomic) IBOutlet SideView *greenView;
@property (weak, nonatomic) IBOutlet SideView *orangeView;

@property (strong, nonatomic)  NSMutableArray <NSMutableArray *> *martix;

@end

@implementation CubeView

-(void)rotateRight {
    
}


@end
