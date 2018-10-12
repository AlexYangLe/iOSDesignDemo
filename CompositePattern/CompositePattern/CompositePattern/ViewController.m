//
//  ViewController.m
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "ViewController.h"
#import "YLeFile.h"
#import "FileCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)  YLeFile *rootFile;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initRootFile];
    [self initTableView];
}

-(void)initRootFile{
    self.rootFile = [YLeFile createWithFileType:YLEFOLDER name:@"rootFolder"];
    
    //创建文件夹
    YLeFile *A = [YLeFile createWithFileType:YLEFOLDER name:@"A"];
    YLeFile *B = [YLeFile createWithFileType:YLEFOLDER name:@"B"];
    YLeFile *C = [YLeFile createWithFileType:YLEFOLDER name:@"C"];
    
    YLeFile *a_1 = [YLeFile createWithFileType:YLEFOLDER name:@"a_1"];
    YLeFile *a_2 = [YLeFile createWithFileType:YLEFOLDER name:@"a_2"];
    YLeFile *a_3 = [YLeFile createWithFileType:YLEFILE name:@"a_3"];
    YLeFile *a_4 = [YLeFile createWithFileType:YLEFOLDER name:@"a_4"];
    
    [A addFile:a_1];
    [A addFile:a_2];
    [A addFile:a_3];
    [A addFile:a_4];
    
    [a_1 addFile:[YLeFile createWithFileType:YLEFOLDER name:@"a_1_1"]];
    [a_2 addFile:[YLeFile createWithFileType:YLEFILE name:@"a_1_2"]];
    [a_3 addFile:[YLeFile createWithFileType:YLEFILE name:@"a_1_3"]];
    
    
    YLeFile *D = [YLeFile createWithFileType:YLEFILE name:@"D"];
    
    [self.rootFile addFile:A];
    [self.rootFile addFile:B];
    [self.rootFile addFile:C];
    [self.rootFile addFile:D];
    
    
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    [self.view addSubview:self.tableView];
    
}

#pragma mark tableview DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.rootFile.files.count;
}


#pragma mark tableview Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    cell.data       = self.rootFile.files[indexPath.row];
    cell.indexPath  = indexPath;
    cell.tableView  = tableView;
    cell.controller = self;
    
    [cell loadContent];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
