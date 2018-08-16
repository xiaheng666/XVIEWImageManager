//
//  ImageManager.m
//  ImageManager
//
//  Created by yyj on 2018/7/11.
//  Copyright © 2018年 zd. All rights reserved.
//

#import "ImageManager.h"
#import "RITLPhotoNavigationViewController.h"
#import "RITLPhotoNavigationViewModel.h"
#import "XVIEWSDKObject.h"
#import <Photos/Photos.h>
@implementation ImageManager
+ (instancetype)defaultImageManager{
    static ImageManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ImageManager alloc]init];
    });
    return manager;
}
/*
 *  上传图片
 *  maxnumber 最大上传数量
 *  currentVc 当前vc
 */
- (void)uploadImage:(NSDictionary*)para imageCallBack:(void (^)(XVIEWSDKResonseStatusCode code,NSDictionary* info))imageCallBack{
    RITLPhotoNavigationViewModel * viewModel = [RITLPhotoNavigationViewModel new];
    if (para[@"maxnumber"] && [para[@"maxnumber"] integerValue] > 0 && [para[@"maxnumber"] integerValue] < 9) {
        viewModel.maxNumberOfSelectedPhoto = [para[@"maxnumber"] integerValue];
    }
    __weak typeof(self) weakSelf = self;
    //    设置需要图片剪切的大小，不设置为图片的原比例大小
    //    viewModel.imageSize = _assetSize;
    //获得图片
    viewModel.RITLBridgeGetImageBlock = ^(NSArray <UIImage *> * images){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (images.count > 0) {
            NSMutableArray *imageArray = [[NSMutableArray alloc] init];
            for (UIImage *img in images) {
                [imageArray addObject:[strongSelf image2DataURL:img]];
            }
            imageCallBack(XVIEWSDKCodeSuccess,@{@"code":@"0", @"message":@"success", @"data":imageArray});
        } else {
            imageCallBack(XVIEWSDKCodeFail,@{@"code":@"-1", @"message":@"未选择图片", @"data":@[]});
        }
    };
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc = (UIViewController*)para[@"currentVC"];
        RITLPhotoNavigationViewController * viewController = [RITLPhotoNavigationViewController photosViewModelInstance:viewModel];
        [vc presentViewController:viewController animated:true completion:^{}];
    });
}
- (NSString *)image2DataURL:(UIImage *)image {
    NSData *imageData = nil;
    NSString *mimeType = nil;
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [imageData base64EncodedStringWithOptions: 0]];
}
- (BOOL) imageHasAlpha: (UIImage *)image {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
@end
