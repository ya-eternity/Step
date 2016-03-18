//
//  ZWAnnulusScaleView.m
//  Step
//
//  Created by Zoey on 16/3/18.
//  Copyright © 2016年 Zoey. All rights reserved.
//

#import "ZWAnnulusScaleView.h"

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)

static const CGFloat DefaultRingWith = 10.0;

@interface ZWAnnulusScaleView ()

@property (nonatomic, strong) NSMutableArray *gradientColors;
@property (nonatomic, strong) UIBezierPath *bPath;

@end

@implementation ZWAnnulusScaleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _radius = (frame.size.width < frame.size.height ? frame.size.width : frame.size.height) * 0.5;
        [self _initView];
    }
    return self;
}

- (instancetype)initWithRadius:(CGFloat)radius
{
    _radius = radius;
    return [self initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];
}

- (void)_initView
{
    [self setBackgroundColor:[UIColor blackColor]];
    _gradientColors = @[].mutableCopy;
    
    _ringWidth = DefaultRingWith;
    for (int i = 0; i < 360; i += 5 ) {
        UIColor *color = [UIColor colorWithHue:i / 360.0 saturation:1.0 brightness:1.0 alpha:1.0];
        [_gradientColors addObject:color];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(135)
                                                      clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    _bPath = aPath;
    [aPath stroke];
    [self drawRing];
}

- (void)drawRing
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(135)
                                                      clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    _bPath = aPath;
    
    [aPath stroke];
//    CGContextDrawPath(, kCGPathFill);
}

@end
