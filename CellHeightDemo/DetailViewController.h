//
//  DetailViewController.h
//  CellHeightDemo
//
//  Created by null on 14-12-22.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *dataItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property(nonatomic,strong) UIImage *image;

@end

