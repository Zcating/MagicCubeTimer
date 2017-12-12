//
//  SideView.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RedSide     [UIColor colorWithRed:196/255. green:30/255. blue:58/255. alpha:1]
#define GreenSide   [UIColor colorWithRed:0 green:158/255. blue:96/255. alpha:1]
#define BlueSide    [UIColor colorWithRed:0 green:81/255. blue:186/255. alpha:1]
#define OrangeSide  [UIColor colorWithRed:1 green:88/255. blue:0 alpha:1]
#define YellowSide  [UIColor colorWithRed:1 green:213/255 blue:0 alpha:1]
#define WhiteSide   [UIColor whiteColor]

@interface SideView : UIView

@property (nonatomic, strong) UIColor *blockColor;

//-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end
