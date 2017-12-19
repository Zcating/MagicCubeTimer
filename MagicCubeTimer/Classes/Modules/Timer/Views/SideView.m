//
//  SideView.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "SideView.h"

@implementation SideView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // Create nine subview.
    CGFloat width = rect.size.width/3;
    CGFloat height = rect.size.height/3;
    for (size_t y = 0; y < 3; y++) {
        CGFloat offsetY = y * height;
        for (size_t x = 0; x < 3; x++) {
            CGFloat offsetX = x * width;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, height)];
            view.layer.borderWidth = 0.5;
            [self addSubview:view];
        }
    }
}



@end
