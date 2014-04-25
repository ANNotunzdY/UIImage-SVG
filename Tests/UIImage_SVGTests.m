//
//  UIImage_SVGTests.m
//  UIImage-SVGTests
//
//  Created by Thijs Scheepers on 25/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage+SVG.h"

@interface UIImage_SVGTests : XCTestCase

@end

@implementation UIImage_SVGTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test
{
    UIImage* image = [UIImage imageWithSVGNamed:@"Happyface"
                                     targetSize:CGSizeMake(200, 200)
                                      fillColor:[UIColor blueColor]];

    XCTAssert(image != nil, @"Image shouldnt be nil.");
}

@end
