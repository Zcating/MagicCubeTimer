//
//  CubeView.m
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "CubeView.h"
#import "SideView.h"

@interface CubeView()

@property (weak, nonatomic) IBOutlet SideView *yellowView;
@property (weak, nonatomic) IBOutlet SideView *blueView;
@property (weak, nonatomic) IBOutlet SideView *redView;
@property (weak, nonatomic) IBOutlet SideView *whiteView;
@property (weak, nonatomic) IBOutlet SideView *greenView;
@property (weak, nonatomic) IBOutlet SideView *orangeView;


@end

@implementation CubeView

-(ColorMatrix *)matrix {
    if (_matrix == nil) {
        _matrix = [[ColorMatrix alloc] init];
    }
    return _matrix;
}

-(void)resetView {
    [self.matrix reset];
//    self.yellowView.colors = self.matrix.yellowSide;
}

@end
