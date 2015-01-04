//
//  LLTableViewCell.h
//  CellHeightDemo
//
//  Created by null on 14-12-22.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property(nonatomic,weak) IBOutlet UILabel *detailLabel;

@end
