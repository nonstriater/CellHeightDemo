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

@interface MasterViewController ()

#define Screen_Width [[UIScreen mainScreen] bounds].size.width

@property NSMutableArray *objects;
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
    
    
    self.objects = [NSMutableArray arrayWithArray:@[@"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want",
                                                    @"In the case of topLayoutGuide, the property indicates the highest  (such as a status or navigation bar) vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar .",
                                                    @"In the case of topLayoutGuide",
                                                    @"In the case of topLayoutGuide, the property indicates the highest vertical extent for content that you don't want to appear behind a translucent or transparent UIKit bar (such as a status or navigation bar). So, if your view controller has been pushed onto a UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar.",
                                                    @"UINavigationController stack, topLayoutGuide will tell you how many points from the top of the screen the status bar and navigation bar cover. You can use this value scroll content in a UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar.",
                                                    @"UIScrollView to just below the navigation bar or ensure other content in your view isn't being covered by the UINavigationBar."]];
    
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

// 返回一个cell的预估高度，这样tableview首次加载时不会调用heightForRow方法，这样tableview可以显示出来，等到cell可见时，再调用heightForRow获取cell的真正高度
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44.f;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CGFloat topMargin = 38.f;
//    CGFloat bottomMargin = 20.f;
//    NSString *text = self.objects[indexPath.row];
//    CGSize size = [text boundingRectWithSize:CGSizeMake(Screen_Width-81-20.f, 10000.f) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.f]} context:nil].size;
//    
//    return size.height+topMargin+bottomMargin ;
//}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.detailLabel.text = self.objects[indexPath.row];
     cell.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    return cell;
}

@end
