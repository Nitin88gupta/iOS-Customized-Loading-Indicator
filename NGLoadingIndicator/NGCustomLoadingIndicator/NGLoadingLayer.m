//
//  NGLoadingLayer.m
//  NGLoadingIndicator
//
//  Created by Nitin Gupta on 20/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGLoadingLayer.h"

@implementation NGLoadingLayer
@synthesize ovalRect = _ovalRect;
@synthesize lineWidth = _lineWidth;
@synthesize colorLine = _colorLine;
@synthesize ang1 = _ang1;
@synthesize ang2 = _ang2;
@synthesize ang3 = _ang3;
@synthesize ang4 = _ang4;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[[UIColor clearColor] CGColor]];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)theContext {
    
    float arcOffSet = 70;
    float radius = CGRectGetWidth(_ovalRect) / 2;
    float startAngle = 0.0f;
    float endAngle = 0.0f;
    CGPoint center = CGPointMake(CGRectGetMidX(_ovalRect), CGRectGetMidY(_ovalRect));;
    
    //// Arc 1
    UIBezierPath* arcPath = [UIBezierPath bezierPath];
    startAngle = _ang1 * M_PI/180;
    endAngle = (_ang1 + arcOffSet) * M_PI/180;
    [arcPath addArcWithCenter:center  radius:radius startAngle:startAngle  endAngle:endAngle  clockwise: YES];//190
    CGContextAddPath(theContext, arcPath.CGPath);
    
    //// Arc 2
    UIBezierPath* arc2Path = [UIBezierPath bezierPath];
    startAngle = _ang2 * M_PI/180;
    endAngle = (_ang2 + arcOffSet) * M_PI/180;
    [arc2Path addArcWithCenter:center  radius:radius startAngle:startAngle  endAngle:endAngle  clockwise: YES];//280
    CGContextAddPath(theContext, arc2Path.CGPath);
    
    //// Arc 3
    UIBezierPath* arc3Path = [UIBezierPath bezierPath];
    startAngle = _ang3 * M_PI/180;
    endAngle = (_ang3 + arcOffSet) * M_PI/180;
    [arc3Path addArcWithCenter:center  radius:radius startAngle:startAngle  endAngle:endAngle  clockwise: YES];//10
    CGContextAddPath(theContext, arc3Path.CGPath);
    
    //// Arc 4
    UIBezierPath* arc4Path = [UIBezierPath bezierPath];
    startAngle = _ang4 * M_PI/180;
    endAngle = (_ang4 + arcOffSet) * M_PI/180;
    [arc4Path addArcWithCenter:center  radius:radius startAngle:startAngle  endAngle:endAngle  clockwise: YES];//100
    CGContextAddPath(theContext, arc4Path.CGPath);
    
    
    CGContextSetLineWidth(theContext,_lineWidth);
    CGContextSetStrokeColorWithColor(theContext, _colorLine.CGColor);
    CGContextStrokePath(theContext);
}


@end
