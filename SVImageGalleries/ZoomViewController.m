//
//  ZoomViewController.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ZoomViewController.h"
#import "CurrentImage.h"

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
    
//    self.zoomScrollView.backgroundColor = [UIColor magentaColor];
    
    self.zoomImageView = [[UIImageView alloc] initWithImage:[CurrentImage sharedInstance].imageToPass];
    self.zoomImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.zoomImageView.userInteractionEnabled = YES;
    [self.zoomScrollView addSubview:self.zoomImageView];
//    self.zoomImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.zoomImageView.frame = self.zoomScrollView.frame;
    
//    [self setImageViewConstraints];
    
    self.zoomScrollView.minimumZoomScale = 0.1;
    self.zoomScrollView.maximumZoomScale = 5.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setImageViewConstraints {
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.zoomScrollView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.zoomScrollView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.zoomScrollView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
    
    [self.zoomScrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.zoomImageView
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
