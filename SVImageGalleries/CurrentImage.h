//
//  CurrentImage.h
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CurrentImage : NSObject

@property (nonatomic, strong) UIImage *imageToPass;

+ (instancetype)sharedInstance;

@end
