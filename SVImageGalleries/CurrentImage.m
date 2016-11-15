//
//  CurrentImage.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "CurrentImage.h"

@implementation CurrentImage

+ (instancetype)sharedInstance
{
    static CurrentImage *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CurrentImage alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}


@end
