//
//  UIBezierPath+SVG.m
//  UIImage-SVG
//
//  Created by Remy Strijker on 03-07-14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "UIBezierPath+SVG.h"

@implementation UIBezierPath (SVG)

NSString *_fillColor;

-(void) setFillColor:(NSString *)fillColor {
    NSLog(@"Fillcolor %@", fillColor);
    _fillColor = fillColor;
}

-(NSString *)fillColor {
    NSLog(@"Get fillcolor %@", _fillColor);
    return _fillColor;
}
@end
