//
//  UIImage+SVG.m
//  UIImage-SVG
//
//  Created by Freddie Tilley en Thijs Scheepers on 25/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "UIImage+SVG.h"
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

		PocketSVG *svg = [[PocketSVG alloc] initFromSVGFileNamed: svgName];
        CGSize size = svg.bezier.bounds.size;
		CGFloat boundingBoxAspectRatio = size.width / size.height;
		CGFloat targetAspectRatio = targetSize.width / targetSize.height;
		CGFloat scaleFactor = 1.0f;
		CGAffineTransform transform;

		if (boundingBoxAspectRatio > targetAspectRatio) {
			scaleFactor = targetSize.width / size.width;
		} else {
			scaleFactor = targetSize.height / size.height;
        }

		transform = CGAffineTransformIdentity;
		transform = CGAffineTransformScale(transform, scaleFactor, scaleFactor);

		UIGraphicsBeginImageContextWithOptions(targetSize, NO, [[UIScreen mainScreen] scale]);
		CGContextRef context = UIGraphicsGetCurrentContext();
		CGContextSetFillColorWithColor(context, [fillColor CGColor]);

        CGPathRef scaledPath = CGPathCreateCopyByTransformingPath([svg.bezier CGPath], &transform);
        CGContextAddPath(context, scaledPath);
        CGPathRelease(scaledPath);

		CGContextFillPath(context);

		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();

		if (cacheImage) {
			[[SVGImageCache sharedImageCache] addImageToCache:image forKey:cacheKey];
        }
	}
    
	return image;
}


@end
