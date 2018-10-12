//
//  FileCell.h
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileCell : UITableViewCell

@property(nonatomic, weak) id data;
@property(nonatomic, weak) NSIndexPath *indexPath;
@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, weak) UIViewController *controller;

-(void)loadContent;



@end
