//
//  ViewController.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollview;


@property (nonatomic, strong) IBOutlet UIImageView *lighthouseFieldView;
@property (nonatomic, strong) IBOutlet UIImageView *lighthouseNightView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@property (nonatomic, readonly) NSArray *lighthouseImageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pageScrollview.backgroundColor = [UIColor blackColor];
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToZoomVC:)];
    self.tapGR.numberOfTouchesRequired = 2;
    self.tapGR.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setUpScrollview];
    
    [self.pageScrollview addGestureRecognizer:self.tapGR];
}

-(void)setUpScrollview {
    
    CGFloat imagesAdded = 1;
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.pageScrollview.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.pageScrollview.frame);
    
    for (UIImage *lighthouseImage in self.lighthouseImageArray) {
        
        UIImageView *lighthouseImageView = [[UIImageView alloc] initWithImage:lighthouseImage];
        lighthouseImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.pageScrollview addSubview:lighthouseImageView];
        lighthouseImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addImageViewConstraints:self.pageScrollview UIImageview:lighthouseImageView imagesAdded:imagesAdded];
        
//        [lighthouseImageView addGestureRecognizer:self.tapGR];
        
        imagesAdded += 2;
    }
    
    CGFloat widthOfAllImages = scrollViewWidth*self.lighthouseImageArray.count;
    
    self.pageScrollview.contentSize = CGSizeMake(widthOfAllImages, scrollViewHeight);
    
    self.pageScrollview.pagingEnabled = YES;
}


-(NSArray *)lighthouseImageArray {
    
    return @[[UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"]];
}


-(void)addImageViewConstraints:(UIScrollView *)scrollView UIImageview:(UIImageView *)imageView imagesAdded:(CGFloat)imagesAdded {
    
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:imageView
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:imagesAdded
                                                            constant:0.0]];
    
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                            constant:0.0]];
}



-(void)goToZoomVC:(UITapGestureRecognizer *)tapGR {
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isEqual:self.tapGR]) {
        return YES;
    }
    
    return NO;
}

@end
