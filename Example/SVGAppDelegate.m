//
//  SVGAppDelegate.m
//  UIImage-SVG
//
//  Created by Thijs Scheepers on 25/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "SVGAppDelegate.h"
#import "UIImage+SVG.h"

@implementation SVGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    UIViewController *rootViewController = [UIViewController new];

    self.window.rootViewController = rootViewController;
    /*
    UIImage* image = [UIImage imageWithSVGNamed:@"Happyface"
                                     targetSize:CGSizeMake(100, 100)
                                      fillColor:[UIColor blueColor]];
   
    UIImage* image2 = [UIImage imageWithSVGNamed:@"tabbar_about"
                                      targetSize:CGSizeMake(100, 100)
                                       fillColor:[UIColor greenColor]];
    */
    UIImage* image3 = [UIImage imageWithSVGNamed:@"tabbar_events"
                                      targetSize:CGSizeMake(100, 100)
                                       fillColor:[UIColor yellowColor]];
    /*
    UIImage* image4 = [UIImage imageWithSVGNamed:@"tabbar_locations"
                                      targetSize:CGSizeMake(100, 100)
                                       fillColor:[UIColor brownColor]];
    
    UIImage* image5 = [UIImage imageWithSVGNamed:@"tabbar_news"
                                      targetSize:CGSizeMake(100, 100)
                                       fillColor:[UIColor purpleColor]];

    UIImageView *IV = [[UIImageView alloc] initWithImage:image];
    IV.frame = CGRectMake(0, 0, IV.frame.size.width, IV.frame.size.height);

    UIImageView *IV2 = [[UIImageView alloc] initWithImage:image2];
    IV2.frame = CGRectMake(0, 100, IV2.frame.size.width, IV2.frame.size.height);
    */
    UIImageView *IV3 = [[UIImageView alloc] initWithImage:image3];
    IV3.frame = CGRectMake(0, 200, IV3.frame.size.width, IV3.frame.size.height);
    /*
    UIImageView *IV4 = [[UIImageView alloc] initWithImage:image4];
    IV4.frame = CGRectMake(0, 300, IV4.frame.size.width, IV4.frame.size.height);
    
    UIImageView *IV5 = [[UIImageView alloc] initWithImage:image5];
    IV5.frame = CGRectMake(0, 400, IV5.frame.size.width, IV5.frame.size.height);
    
    [rootViewController.view addSubview:IV];
    [rootViewController.view addSubview:IV2];
    */[rootViewController.view addSubview:IV3];
   // [rootViewController.view addSubview:IV4];
   // [rootViewController.view addSubview:IV5];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
