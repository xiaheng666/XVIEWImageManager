//
//  XVIEWMultiImageManager.h
//  XVIEWMultiImageManager
//
//  Created by yyj on 2019/1/3.
//  Copyright © 2019 zd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XVIEWMultiImageManager : NSObject

/**
 *  单例
 */
+ (instancetype)sharedMultiImageManager;

/**
 *  选择图片上传
 @param  param   data:{@"photoMaxNum":图片最大数量,@"isEdit":是否可编辑 1 可编辑  0不可编辑,@"videoMaxNum":视频最大数量,@"color":主题颜色,@"type":0图片/1视频/2均可}
                callback:回调
 */
- (void)choosePics:(NSDictionary *)param;

@end
