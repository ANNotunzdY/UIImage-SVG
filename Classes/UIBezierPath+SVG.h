//
//  UIBezierPath+SVG.h
//  UIImage-SVG
//
//  Created by Remy Strijker on 03-07-14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (SVG)
@property (nonatomic, copy) NSString *fillColor;

-(void) setFillColor:(NSString *)fillColor;
-(NSString *)fillColor;
@end
