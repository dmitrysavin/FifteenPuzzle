//
//  AppDelegate.m
//  FifteenPuzzle
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import "AppDelegate.h"
#import "PlayViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    PlayViewController *playViewController = [PlayViewController new];
    self.window.rootViewController = playViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
