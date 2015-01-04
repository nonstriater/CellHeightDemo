//
//  LLPhotoPreviewDismissTransition.m
//  CellHeightDemo
//
//  Created by null on 14-12-27.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "LLPhotoPreviewDismissTransition.h"
#import "LLTableViewCell.h"
#import "MasterViewController.h"
#import "MWPhotoBrowser.h"
#import "DetailViewController.h"

@implementation LLPhotoPreviewDismissTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = [transitionContext containerView];

    DetailViewController *fromVC = (DetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    MasterViewController *toVC = (MasterViewController *)[(UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] viewControllers][0];
    LLTableViewCell *cell = (LLTableViewCell *)[toVC tableViewCellForDataItem:fromVC.dataItem];
    cell.avatarImageView.hidden = YES;
    UIView *avatarView = [fromVC.imageView snapshotViewAfterScreenUpdates:YES];
    avatarView.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.view];

    //截屏了以后再能隐藏
    fromVC.imageView.hidden = YES;
    [containerView addSubview:avatarView];
    
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.alpha = 0.f;
        CGRect toFrame = [containerView convertRect:cell.avatarImageView.frame fromView:cell.avatarImageView.superview];
        avatarView.frame = toFrame;
        
    } completion:^(BOOL finished) {
        cell.avatarImageView.hidden = NO;
        fromVC.imageView.hidden = NO;
        [avatarView removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
  
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 2.5f;
}

@end
