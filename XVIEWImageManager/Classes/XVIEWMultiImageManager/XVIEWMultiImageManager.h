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
 @param  param   data:{@"maxnumber":最大数量}
                callback:回调
 */
- (void)choosePics:(NSDictionary *)param;

@end
