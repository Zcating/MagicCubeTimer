//
//  CubeView.h
//  MagicCubeTimer
//
//  Created by  zcating on 12/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorMatrix.h"

@interface CubeView : UIView

@property (strong, nonatomic) ColorMatrix *matrix;

-(void)resetView;

@end
