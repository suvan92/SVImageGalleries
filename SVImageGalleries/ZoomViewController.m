//
//  ZoomViewController.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *zoomScrollView;


@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [self.zoomScrollView addSubview:imageView];
    
    [self setImageViewConstraints:imageView];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setImageViewConstraints:(UIImageView *)imageView {
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.zoomScrollView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.zoomScrollView
                                                                   attribute:NSLayoutAttributeLeft
                                                                  multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.zoomScrollView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.zoomScrollView
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                     constant:0.0]];
    
    
}


@end
