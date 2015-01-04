//
//  LLPhotoPreviewTransition.m
//  CellHeightDemo
//
//  Created by null on 14-12-27.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "LLPhotoPreviewPresentingTransition.h"
#import "LLTableViewCell.h"
#import "MasterViewController.h"
#import "MWPhotoBrowser.h"
#import "DetailViewController.h"

@implementation LLPhotoPreviewPresentingTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = [transitionContext containerView];

    MasterViewController *fromVC = (MasterViewController *)[(UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] viewControllers][0];
    LLTableViewCell *cell = (LLTableViewCell *)[fromVC.tableView cellForRowAtIndexPath:[fromVC.tableView indexPathForSelectedRow]];
    UIView *avatarView = [cell.avatarImageView snapshotViewAfterScreenUpdates:YES];
    cell.avatarImageView.hidden = YES;
    avatarView.frame = [containerView convertRect:cell.avatarImageView.frame fromView:cell.avatarImageView.superview];
    
    //MWPhotoBrowser *toVC = (MWPhotoBrowser *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    DetailViewController *toVC = (DetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0.f;
    toVC.imageView.hidden = YES;
    

    [containerView addSubview:toVC.view];
    [containerView addSubview:avatarView];
    
    //animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1.f;
        CGRect toFrame = [containerView convertRect:toVC.imageView.frame fromView:toVC.view];
        avatarView.frame = toFrame;
    } completion:^(BOOL finished) {
        toVC.imageView.hidden = NO;
        cell.avatarImageView.hidden = NO;
        [avatarView removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

/*
 1. imageView frame如何确定
 */

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 2.5f;
}

@end
