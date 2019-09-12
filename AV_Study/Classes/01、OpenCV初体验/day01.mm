//
//  day01.m
//  AV_Study
//
//  Created by aStudyer on 2019/9/11.
//  Copyright © 2019 aStudyer. All rights reserved.
//

#import "day01.h"
#import "ImageUtils.h"

@interface day01 ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation day01

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/// 原始图片
- (IBAction)originImg:(UIButton *)sender{
    self.imageView.image = [UIImage imageNamed:@"Test.png"];
}

/// 马赛克图片
- (IBAction)mosaicImg:(UIButton *)sender{
    self.imageView.image = [ImageUtils opencvImage:[UIImage imageNamed:@"Test.png"] level:20];
}

@end
