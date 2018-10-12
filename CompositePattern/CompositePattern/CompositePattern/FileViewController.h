//
//  FileViewController.h
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLeFile.h"

@interface FileViewController : UIViewController
@property(nonatomic, strong) YLeFile *rootFile;
@end
