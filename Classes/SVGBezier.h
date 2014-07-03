//
//  SVGBezier.h
//  UIImage-SVG
//
//  Created by Remy Strijker on 02-07-14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//


#ifdef TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
@interface SVGBezier : UIBezierPath
@property (nonatomic, retain) NSString *fillColor;
@end
#else
#import <Cocoa/Cocoa.h>
@interface SVGBezier : NSBezierPath
@property (nonatomic, retain) NSString *fillColor;
@end
#endif