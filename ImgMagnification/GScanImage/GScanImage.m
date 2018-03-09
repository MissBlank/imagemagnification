//
//  GScanImage.m
//  imgBig
//
//  Created by NERC on 2018/3/9.
//  Copyright © 2018年 G. All rights reserved.
//

#import "GScanImage.h"

@implementation GScanImage

static CGRect oldFrame;

+(void)scanBigImgWithImgV:(UIImageView *)currentImageView{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [self scanBigImgWithImg:currentImageView.image frame:[currentImageView convertRect:currentImageView.bounds toView:window]];
    
    
}




+(void)scanBigImgWithImg:(UIImage *)image frame:(CGRect)OldFrame{
    
    oldFrame =OldFrame;
    UIWindow * window =[UIApplication sharedApplication].keyWindow;
    
    UIView * backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [backgroundView setBackgroundColor:[UIColor colorWithRed:107/255.0 green:107/255.0 blue:99/255.0 alpha:0.6]];
    [backgroundView setAlpha:0];
    
    UIImageView * imageV=[[UIImageView alloc] initWithFrame:oldFrame];
    [imageV setImage:image];
    [imageV setTag:1024];
    [backgroundView addSubview:imageV];
    
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer * tapGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImgV:)];
    [backgroundView addGestureRecognizer:tapGestureRecognizer];
    
    //动画放大所展示的内容
    [UIView animateWithDuration:0.4 animations:^{
        CGFloat y,height,width;
        y = ([UIScreen mainScreen].bounds.size.height - image.size.height * [UIScreen mainScreen].bounds.size.width/image.size.width)*0.5;
        
        //图片宽度，这是基点
        width = [UIScreen mainScreen].bounds.size.width;
        //根据图片的宽高比设置
        height =image.size.height* [UIScreen mainScreen].bounds.size.width / image.size.width;
        [imageV setFrame:CGRectMake(0, y, width, height)];
        
        //！！！！！将视图显示出来
        [backgroundView setAlpha:1];
        
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    
    
}

/**
 恢复imgV的原始尺寸
 
 
 */
+(void)hideImgV:(UITapGestureRecognizer *)tap{
    UIView * backgroundView = tap.view;

    //原始imageview
    UIImageView * imageView=[tap.view viewWithTag:1024];
     //恢复原来视图
    [UIView animateWithDuration:2 animations:^{
        [imageView setFrame:oldFrame];
        [backgroundView setAlpha:0];
    } completion:^(BOOL finished) {
        //完成操作——将试图删除
        [backgroundView removeFromSuperview];
    }];

    
    
}



















@end
