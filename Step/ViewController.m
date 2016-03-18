//
//  ViewController.m
//  Step
//
//  Created by Zoey on 16/3/18.
//  Copyright © 2016年 Zoey. All rights reserved.
//

#import "ViewController.h"
#import "ZWAnnulusScaleView.h"

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:self.view.center
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(135)
                                                      clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [aPath stroke];
    ZWAnnulusScaleView *view = [[ZWAnnulusScaleView alloc] initWithFrame:CGRectMake(0, 0, 200, 180)];
    view.center = self.view.center;
//    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
