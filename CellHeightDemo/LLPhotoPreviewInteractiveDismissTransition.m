//
//  LLPhotoPreviewInteractiveDismissTransition.m
//  CellHeightDemo
//
//  Created by null on 14-12-29.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "LLPhotoPreviewInteractiveDismissTransition.h"

@implementation LLPhotoPreviewInteractiveDismissTransition

- (id)initWithViewController:(UIViewController *)viewController{

    if (self = [super init]) {
        
        [self preparePanGestureInView:viewController.view];
    }
    return self;
}

- (void)preparePanGestureInView:(UIView *)view{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [view addGestureRecognizer:pan];
    
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture{

    
}

@end
