//
//  FileCell.m
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "FileCell.h"
#import "YLeFile.h"
#import "FileViewController.h"

@interface FileCell()

@property (nonatomic, strong) UIImageView  *fileImageView;
@property (nonatomic, strong) UIImageView  *folderImageView;
@property (nonatomic, strong) UILabel      *iconNameLabel;
@property (nonatomic, strong) UIButton     *button;
@property (nonatomic, strong) UILabel      *nameLabel;

@end

@implementation FileCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews{
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 79.5f, 500, 0.5f)];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [self addSubview:line];
    
    self.fileImageView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"File"]];
    self.folderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Folder"]];
    self.fileImageView.center   = CGPointMake(40, 50);
    self.folderImageView.center = CGPointMake(40, 50);
    [self addSubview:self.folderImageView];
    [self addSubview:self.fileImageView];
    
    self.iconNameLabel               = [[UILabel alloc] initWithFrame:CGRectMake(0, 13, 80, 20)];
    self.iconNameLabel.font          = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:12.f];
    self.iconNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.iconNameLabel];
    
    self.nameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 60)];
    self.nameLabel.font = [UIFont fontWithName:@"Avenir-Book" size:12.f];
    [self addSubview:self.nameLabel];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 500, 80)];
    [self.button addTarget:self
                    action:@selector(buttonEvent)
          forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.button];
}

-(void)loadContent{
    YLeFile *file = self.data;
    if (file.fileType == YLEFOLDER) {
        self.fileImageView.hidden = YES;
        self.folderImageView.hidden = NO;
        self.iconNameLabel.textColor = [UIColor blackColor];
        self.nameLabel.textColor     = [UIColor blackColor];
        self.iconNameLabel.text      = @"Folder";
    }else{
        self.fileImageView.hidden    = NO;
        self.folderImageView.hidden  = YES;
        self.iconNameLabel.textColor = [UIColor grayColor];
        self.nameLabel.textColor     = [UIColor grayColor];
        self.iconNameLabel.text      = @"File";
    }
    self.nameLabel.text = file.fileName;
}

-(void)buttonEvent{
    YLeFile *file = self.data;
    
    if (file.fileType == YLEFOLDER) {
        FileViewController *fillVC = [[FileViewController alloc] init];
        fillVC.rootFile = file;
        [self.controller.navigationController pushViewController:fillVC animated:YES];
    }
}

@end
