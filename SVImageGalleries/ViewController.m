//
//  ViewController.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "CurrentImage.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollview;

@property (nonatomic, strong) IBOutlet UIImageView *lighthouseFieldView;
@property (nonatomic, strong) IBOutlet UIImageView *lighthouseNightView;
@property (nonatomic, strong) CurrentImage *currentImage;
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@property (nonatomic, readonly) NSArray *lighthouseImageArray;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pageScrollview.backgroundColor = [UIColor clearColor];
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToZoomVC:)];
//    self.tapGR.numberOfTouchesRequired = 2;
    self.tapGR.delegate = self;
    
    self.currentImage = [CurrentImage sharedInstance];
    
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
        lighthouseImageView.userInteractionEnabled = YES;
        
        [self.pageScrollview addSubview:lighthouseImageView];
        lighthouseImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addImageViewConstraints:self.pageScrollview UIImageview:lighthouseImageView imagesAdded:imagesAdded];
        
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

#pragma mark - scroll view

-(void)goToZoomVC:(UITapGestureRecognizer *)tapGR {
    CGPoint tapLocation = [tapGR locationInView:tapGR.view];
    UIView *tappedView = [tapGR.view hitTest:tapLocation withEvent:nil];
    
    if ([tappedView isKindOfClass:[UIImageView class]]) {
        
        [CurrentImage sharedInstance].imageToPass = [(UIImageView *)tappedView image];
        
        [self performSegueWithIdentifier:@"ShowDetailedViewController" sender:self];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat width = scrollView.frame.size.width;
    NSInteger page = (scrollView.contentOffset.x + (0.5f * width)) / width;
    
    self.pageControl.currentPage = page;
    
}


#pragma mark - gesture recognizer

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
