//
//  YLeFile.h
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum:NSInteger {
    YLEFILE, //文件
    YLEFOLDER, //文件夹
}FILETYPE;

@interface YLeFile : NSObject
//文件名
@property(nonatomic, copy) NSString *fileName;
//文件类型
@property(nonatomic, assign) FILETYPE fileType;

-(void)addFile:(YLeFile *)file;

-(void)removeFile:(YLeFile *)file;

-(NSArray *)files;

+(instancetype)createWithFileType:(FILETYPE)type name:(NSString *)name;


@end
