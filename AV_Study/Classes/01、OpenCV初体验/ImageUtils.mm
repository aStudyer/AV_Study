//
//  ImageUtils.m
//  AV_Study
//
//  Created by aStudyer on 2019/9/11.
//  Copyright © 2019 aStudyer. All rights reserved.
//

#import "ImageUtils.h"

@implementation ImageUtils
+ (UIImage *)opencvImage:(UIImage *)image level:(int)level{
    //1、将iOS图片转成opencv的图片(Mat矩阵)
    Mat mat_img_src;
    UIImageToMat(image, mat_img_src);
    
    //2、为了不影响原始图片 拷贝一个新的图片
    Mat mat_img_clone = mat_img_src.clone();
    
    //3、确定宽高
    int width = mat_img_clone.cols;
    int height = mat_img_clone.rows;
    
    //4、图片类型->进行转换 ARGB->RGB  在OpenCV里面只支持->RGB处理
    Mat mat_img_dst;
    cvtColor(mat_img_clone, mat_img_dst, CV_RGBA2RGB, 3);
    
    //5、马赛克处理
    //分析马赛克算法原理
    //level = 3-> 3 * 3矩形
    //动态的处理
    int x = width - level;
    int y = height - level;
    
    for (int i = 0; i < y; i += level) {
        for (int j = 0; j < x; j += level) {
            //创建一个矩形区域
            Rect2i mosaicRect = Rect2i(j, i, level, level);
            
            //给填Rect2i区域->填充数据->原始数据
            Mat roi = mat_img_dst(mosaicRect);
            
            //让整个矩形区域颜色值保持一致
            //mat_image_clone.at<Vec3b>(i, j)->像素点（颜色值组成->多个）->ARGB->数组
            //mat_image_clone.at<Vec3b>(i, j)[0]->R值
            //mat_image_clone.at<Vec3b>(i, j)[1]->G值
            //mat_image_clone.at<Vec3b>(i, j)[2]->B值
            Scalar scalar = Scalar(
                                   mat_img_clone.at<Vec3b>(i, j)[0],
                                   mat_img_clone.at<Vec3b>(i, j)[1],
                                   mat_img_clone.at<Vec3b>(i, j)[2]);
            
            //将处理好矩形区域->数据->拷贝到图片上面去->修改后的数据
            //CV_8UC3解释一下->后面也会讲到
            //CV_:表示框架命名空间
            //8表示：32位色->ARGB->8位 = 1字节 -> 4个字节
            //U分析
            //两种类型：有符号类型(Sign->有正负->简写"S")、无符号类型(Unsign->正数->"U")
            //无符号类型：0-255(通常情况)
            //有符号类型：-128-127
            //C分析：char类型
            //3表示：3个通道->RGB
            Mat roiCopy = Mat(mosaicRect.size(), CV_8UC3, scalar);
            roiCopy.copyTo(roi);
        }
    }
    
    //6、将OpenCV图片->iOS图片
    return MatToUIImage(mat_img_dst);
}
@end
