//
//  UIImage+MCScale.m
//  MagicCubeTimer
//
//  Created by  zcating on 11/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "UIImage+MCScale.h"

@implementation UIImage (MCScale)

-(UIImage *)scaleToSize:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return scaledImage;
}

@end
