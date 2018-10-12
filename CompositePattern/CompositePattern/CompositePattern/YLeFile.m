//
//  YLeFile.m
//  CompositePattern
//
//  Created by yanglele on 2018/10/12.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLeFile.h"
@interface YLeFile()
@property(nonatomic, strong) NSMutableArray *filesArray;
@end


@implementation YLeFile

-(instancetype)init{
    self = [super init];
    if (self) {
        self.filesArray = [NSMutableArray array];
    }
    return self;
}

-(void)addFile:(YLeFile *)file{
    [self.filesArray addObject:file];
}

-(void)removeFile:(YLeFile *)file{
    [self.filesArray removeObject:file];
}



-(NSArray *)files{
    return self.filesArray;
}

+(instancetype)createWithFileType:(FILETYPE)type name:(NSString *)name{
    YLeFile *file = [[YLeFile alloc] init];
    file.fileName = name;
    file.fileType = type;
    return file;
    
}


@end
