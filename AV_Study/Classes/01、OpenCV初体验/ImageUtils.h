//
//  ImageUtils.h
//  AV_Study
//
//  Created by aStudyer on 2019/9/11.
//  Copyright © 2019 aStudyer. All rights reserved.
//

#import <UIKit/UIKit.h>
//倒入OpenCV框架
//核心头文件
#import <opencv2/opencv.hpp>
//对iOS支持
#import <opencv2/imgcodecs/ios.h>
//导入矩阵帮助类
#import <opencv2/highgui.hpp>
#import <opencv2/core/types.hpp>

//导入C++命名空间
using namespace cv;

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtils : NSObject

//定义方法:处理图片
+ (UIImage *)opencvImage:(UIImage *)image level:(int)level;

@end

NS_ASSUME_NONNULL_END
