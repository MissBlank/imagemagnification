//
//  ViewController.m
//  imgBig
//
//  Created by NERC on 2018/3/9.
//  Copyright © 2018年 G. All rights reserved.
//

#import "ViewController.h"
#import "GScanImage.h"

#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property(nonatomic,strong)UIImageView * imgV1;
@property(nonatomic,strong)UIImageView * imgV2;
@property(nonatomic,strong)UIImageView * imgV3;


@end

@implementation ViewController
@synthesize imgV1,imgV2,imgV3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    imgV1=[[UIImageView alloc]initWithFrame:CGRectMake(100, 50, ScreenWidth/3, ScreenWidth/3)];
    imgV1.image=[UIImage imageNamed:@"img1"];
    [self.view addSubview:imgV1];
    UITapGestureRecognizer * tapGestureRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOneAction:)];
    [imgV1 addGestureRecognizer:tapGestureRecognizer1];
    [imgV1 setUserInteractionEnabled:YES];
    
    imgV2=[[UIImageView alloc]initWithFrame:CGRectMake(100, (ScreenHeight-140)/3+20, ScreenWidth/3, ScreenWidth/3)];
    imgV2.image=[UIImage imageNamed:@"img2"];
    [self.view addSubview:imgV2];
    UITapGestureRecognizer * gestureRecognizerTwo =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwoAction:)];
    [imgV2 addGestureRecognizer:gestureRecognizerTwo];
    [imgV2 setUserInteractionEnabled:YES];
    
    imgV3=[[UIImageView alloc]initWithFrame:CGRectMake(100, (ScreenHeight-140)/3*2+40, ScreenWidth/3, ScreenWidth/3)];
    imgV3.image=[UIImage imageNamed:@"img3"];
    [self.view addSubview:imgV3];
    UITapGestureRecognizer * gestureRecognizerThree=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapThreeAction:)];
    [imgV3 addGestureRecognizer:gestureRecognizerThree];
    [imgV3 setUserInteractionEnabled:YES];
    
    
    
    
    
}


-(void)tapOneAction:(UITapGestureRecognizer *)tap{
    
    UIImageView * imgV=(UIImageView *)tap.view;
    
    [GScanImage scanBigImgWithImgV:imgV];
    
    
}

-(void)tapTwoAction:(UITapGestureRecognizer *)tap{
    
    UIImageView * imgV=(UIImageView *)tap.view;
    UIWindow * window =[UIApplication sharedApplication].keyWindow;
    
//    [GScanImage scanBigImgWithImgV:imgV];
    [GScanImage scanBigImgWithImg:imgV.image frame:[imgV convertRect:imgV.bounds toView:window]];
}

-(void)tapThreeAction:(UITapGestureRecognizer *)tap{
    UIImageView * imgV= (UIImageView *)tap.view;
    [GScanImage scanBigImgWithImgV:imgV];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
