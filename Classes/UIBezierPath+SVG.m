//
//  UIBezierPath+SVG.m
//  UIImage-SVG
//
//  Created by Remy Strijker on 03-07-14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "UIBezierPath+SVG.h"

@implementation UIBezierPath (SVG)
-(void) setFillColor:(NSString *)fillColor {
    self.fillColor = fillColor;
}
-(NSString *)fillColor {
    return self.fillColor;
}
@end
