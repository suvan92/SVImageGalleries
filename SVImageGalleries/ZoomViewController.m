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
@property (nonatomic, strong) UIImageView *zoomImageView;


@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.zoomImageView = [[UIImageView alloc] init];
    
    [self.zoomScrollView addSubview:self.zoomImageView];
    [self setImageViewConstraints:self.zoomImageView];
    
    self.zoomScrollView.minimumZoomScale = 0.5;
    self.zoomScrollView.maximumZoomScale = 1.0;
    
    
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

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.zoomImageView;
}


@end
