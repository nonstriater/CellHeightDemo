//
//  MasterViewController.m
//  CellHeightDemo
//
//  Created by null on 14-12-22.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "LLTableViewCell.h"
#import "LLPhotoPreviewPresentingTransition.h"
#import "MWPhotoBrowser.h"

@interface MasterViewController ()<UIViewControllerTransitioningDelegate,MWPhotoBrowserDelegate>

#define Screen_Width [[UIScreen mainScreen] bounds].size.width

@property NSMutableArray *objects;
@property NSMutableArray *photos;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.tableView.estimatedRowHeight = 68.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;//iOS5+
    
    self.photos = [NSMutableArray arrayWithArray:@[@"thing01.jpg",@"thing02.jpg",@"thing03.jpg",@"thing04.jpg",@"thing05.jpg"]];
    
    self.objects = [NSMutableArray arrayWithArray:@[@"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want",
                                                    @"In the case of topLayoutGuide, the property indicates the highest  (such as a status or navigation bar) vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar .",
                                                    @"In the case of topLayoutGuide",
                                                    @"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar (such as a status or navigation bar). So, if your view controller has been pushed onto a UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar.",
                                                    @"UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar."
                                            ]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.avatarImageView.image = [UIImage imageNamed:self.photos[indexPath.row]];
    cell.detailLabel.text = self.objects[indexPath.row];
    cell.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    return cell;
}

//动画
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    MWPhotoBrowser *photoBrowserVC = [[MWPhotoBrowser alloc] initWithDelegate:self];
//    photoBrowserVC.transitioningDelegate = self;
//    
    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detail"];
    detailVC.image = [UIImage imageNamed:self.photos[indexPath.row]];
    detailVC.dataItem = self.photos[indexPath.row];
    detailVC.transitioningDelegate = self;
    detailVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:detailVC animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    if (source==self && [presented isKindOfClass:[DetailViewController class]]) {
        return [[LLPhotoPreviewPresentingTransition alloc] init];
    }else{
        return nil;
    }
}

- (UITableViewCell *)tableViewCellForDataItem:(NSString *)item{
    
    NSUInteger index = [self.photos indexOfObject:item];
    if (index==NSNotFound) {
        return nil;
    }

    return [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
}


#pragma mark mwphotobrowser delegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return [self.photos count];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    
    UIImage *image = [UIImage imageNamed:[self.photos objectAtIndex:index]];
    MWPhoto *photo = [MWPhoto photoWithImage:image];
    return photo;

}


@end


