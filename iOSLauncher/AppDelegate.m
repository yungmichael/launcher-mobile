/*
 * launcher-mobile: a multiplatform flexVDI/SPICE client
 *
 * Copyright (C) 2016 flexVDI (Flexible Software Solutions S.L.)
 *
 * This file is part of launcher-mobile.
 *
 * launcher-mobile is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * launcher-mobile is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with launcher-mobile.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "AppDelegate.h"
#import "globals.h"
#import "spice.h"
#import "draw.h"
#import "gst_ios_init.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    gst_ios_init();

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
    if (engine_spice_is_connected()) {
        engine_save_main_texture();
        engine_spice_disconnect();
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
}

@end
