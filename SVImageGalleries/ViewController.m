//
//  ViewController.m
//  SVImageGalleries
//
//  Created by Suvan Ramani on 2016-11-14.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollview;

@property (nonatomic, strong) IBOutlet UIImageView *lighthouseFieldView;
@property (nonatomic, strong) IBOutlet UIImageView *lighthouseNightView;
@property (nonatomic, strong) IBOutlet UIImageView *lighthouseZoomedView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpScrollview];
}


-(void)setUpScrollview {
    
    UIImage *lighthouseField = [UIImage imageNamed:@"Lighthouse-in-Field"];
    UIImage *lighthouseNight = [UIImage imageNamed:@"Lighthouse-night"];
    UIImage *lighthouseZoomed = [UIImage imageNamed:@"Lighthouse-zoomed"];
    
    self.lighthouseFieldView = [[UIImageView alloc] initWithImage:lighthouseField];
    self.lighthouseNightView = [[UIImageView alloc] initWithImage:lighthouseNight];
    self.lighthouseZoomedView = [[UIImageView alloc] initWithImage:lighthouseZoomed];
    
    [self.pageScrollview addSubview:self.lighthouseFieldView];
    [self.pageScrollview addSubview:self.lighthouseNightView];
    [self.pageScrollview addSubview:self.lighthouseZoomedView];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
