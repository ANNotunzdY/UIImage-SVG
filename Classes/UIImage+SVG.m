//
//  UIImage+SVG.m
//  UIImage-SVG
//
//  Created by Freddie Tilley en Thijs Scheepers on 25/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "UIImage+SVG.h"
#import "UIBezierPath+SVG.h"
#import "SVGImageCache.h"
#import "PocketSVG.h"

@implementation UIImage (SVG)

+ (instancetype)imageWithSVGNamed:(NSString*)svgName
					   targetSize:(CGSize)targetSize
						fillColor:(UIColor*)fillColor
{
	return [self imageWithSVGNamed: svgName
						targetSize: targetSize
						 fillColor: fillColor
							 cache: NO];
}

+ (instancetype)imageWithSVGNamed:(NSString*)svgName
					   targetSize:(CGSize)targetSize
						fillColor:(UIColor*)fillColor
							cache:(BOOL)cacheImage
{
    
    NSDictionary *cacheKey = @{@"name" : svgName,
                               @"size" : [NSValue valueWithCGSize: targetSize],
                               @"color" : fillColor};
    
    UIImage *image = [[SVGImageCache sharedImageCache] cachedImageWithKey: cacheKey];
    
    if (image == nil) {
        
        PocketSVG *svg = [[PocketSVG alloc] initFromSVGFile: svgName];
        CGFloat boundingBoxAspectRatio = svg.width / svg.height;
        CGFloat targetAspectRatio = targetSize.width / targetSize.height;
        CGFloat scaleFactor = 1.0f;
        CGAffineTransform transform;
        
        if (boundingBoxAspectRatio > targetAspectRatio) {
            scaleFactor = targetSize.width / svg.width;
        } else {
            scaleFactor = targetSize.height / svg.height;
        }
        
        transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, scaleFactor, scaleFactor);
        
        UIGraphicsBeginImageContextWithOptions(targetSize, NO, [[UIScreen mainScreen] scale]);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, [fillColor CGColor]);
        CGContextSetFillColorWithColor(context, [fillColor CGColor]);
        
        
        // Start draw
        for (BEZIER_PATH_TYPE *path in svg.beziers) {
            float lineWidth = path.lineWidth;
            if(lineWidth < 2.0){
                CGContextSetLineWidth(context, 2.0f);
            } else {
                CGContextSetLineWidth(context, lineWidth);
            }
            
            CGPathRef scaledPath = CGPathCreateCopyByTransformingPath([path CGPath], &transform);
            CGContextAddPath(context, scaledPath);
            
            
            if([path fillColor] != nil && ![[path fillColor] isEqualToString:@""] && ![[path fillColor] isEqualToString:@"none"]){
                CGContextDrawPath(context, kCGPathFill);
                NSLog(@"fil %@", [path fillColor]);
            } else {
                CGContextDrawPath(context, kCGPathStroke);
                NSLog(@"stroke");
            }

        }
        
        // End draw
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (cacheImage) {
            [[SVGImageCache sharedImageCache] addImageToCache:image forKey:cacheKey];
        }
    }
    
    
	return image;
}


@end
