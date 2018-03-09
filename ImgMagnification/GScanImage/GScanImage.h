//
//  GScanImage.h
//  imgBig
//
//  Created by NERC on 2018/3/9.
//  Copyright © 2018年 G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GScanImage : NSObject


/**
 图片在imageView上时
 */
+(void)scanBigImgWithImgV:(UIImageView *)currentImageView;


/**
 图片不在imageView上时
 @param OldFrame 当前imageView的原始尺寸，像素的操作，   [imgV     converRect:imgV.bounds  toView:window]
 */
+(void)scanBigImgWithImg:(UIImage *)image frame:(CGRect)OldFrame;





@end
