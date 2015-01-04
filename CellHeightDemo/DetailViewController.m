//
//  DetailViewController.m
//  CellHeightDemo
//
//  Created by null on 14-12-22.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "DetailViewController.h"
#import "LLPhotoPreviewDismissTransition.h"

@interface DetailViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a
    
    self.imageView.image = [UIImage imageNamed:self.dataItem];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture{

    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    if (dismissed == self) {
        return [[LLPhotoPreviewDismissTransition alloc] init];
    }
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
