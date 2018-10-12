//
//  FileViewController.m
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "FileViewController.h"
#import "FileCell.h"

@interface FileViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rootFile.files.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    
    cell.data = self.rootFile.files[indexPath.row];
    cell.indexPath = indexPath;
    cell.tableView = tableView;
    cell.controller = self;
    
    [cell loadContent];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88.0f;
}


@end
