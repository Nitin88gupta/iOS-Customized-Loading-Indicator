//
//  NGLoadingView.m
//  NGLoadingIndicator
//
//  Created by Nitin Gupta on 20/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGLoadingView.h"
#import "NGLoadingLayer.h"

@interface NGLoadingView () {
    NGLoadingLayer *customLayer_;
    NGLoadingLayer *customLayer2_;
    NGLoadingLayer *customLayer3_;
}
- (void)initializeCustomAnimationLayers;
- (CABasicAnimation *)getRotaionAnimationClockwise:(BOOL)isClockwise withDuration:(float)duration ;
- (void)addProgressLabel ;
@end

@implementation NGLoadingView
- (id)initWithFrame:(CGRect)frame  {
    NSAssert(0,@"This Method Is Depricated Use, initWithFrame:withColor:");
    return nil;
}

- (id)initWithFrame:(CGRect)frame withLoadingColor:(UIColor *)color {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //Default colors for layers
        _color = color;
        
        [self initializeCustomAnimationLayers];
        
        [self addProgressLabel];
    }
    return self;
}

- (void)dealloc {
    
    _color = nil;
    
    if (_progressLabel) {
        if ([_progressLabel superview]) {
            [_progressLabel removeFromSuperview];
        }
        _progressLabel = nil;
    }
    
    [customLayer_ removeAllAnimations];
    customLayer_ = nil;
    
    [customLayer2_ removeAllAnimations];
    customLayer2_ = nil;
    
    [customLayer3_ removeAllAnimations];
    customLayer3_ = nil;
}

- (void)initializeCustomAnimationLayers {
    
    // Could also assign Differnet Color as Well
    const CGFloat* _components = CGColorGetComponents([_color CGColor]);
    CGFloat red     = _components[0];
    CGFloat green = _components[1];
    CGFloat blue   = _components[2];
    CGFloat alpha = _components[3];
    
    float _blendFactor = 0.2f;
    UIColor *_colorCustomLayer = [UIColor colorWithRed:red*_blendFactor green:green*_blendFactor blue:blue*_blendFactor alpha:(alpha+ MAXFLOAT/(arc4random()/MAXFLOAT))];
    UIColor *_colorCustomLayer2 = [UIColor colorWithRed:red*_blendFactor green:green*_blendFactor blue:blue*_blendFactor alpha:(alpha+ MAXFLOAT/(arc4random()/MAXFLOAT))];
    UIColor *_colorCustomLayer3 = [UIColor colorWithRed:red*_blendFactor green:green*_blendFactor blue:blue*_blendFactor alpha:(alpha+ MAXFLOAT/(arc4random()/MAXFLOAT))];

    customLayer_ = [[NGLoadingLayer alloc] init];
    [self.layer addSublayer:customLayer_];
    customLayer_.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale = self.frame.size.width * 0.15;
    customLayer_.ovalRect = CGRectMake(scale , scale, self.frame.size.width - 2*scale,  self.frame.size.height - 2*scale);
    customLayer_.lineWidth = self.frame.size.width * 0.08;
    customLayer_.colorLine = _colorCustomLayer;
    customLayer_.opacity = 0.8f;
    customLayer_.ang1 = 190.0f;
    customLayer_.ang2 = 280.0f;
    customLayer_.ang3 = 100.0f;
    customLayer_.ang4 = 10.0f;
    [customLayer_ setNeedsDisplay];
    [customLayer_ addAnimation:[self getRotaionAnimationClockwise:YES withDuration:MAXFLOAT * 0.8] forKey:@"layerOne"];
    
    customLayer2_ = [[NGLoadingLayer alloc] init];
    [self.layer addSublayer:customLayer2_];
    customLayer2_.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale2 = self.frame.size.width * 0.25;
    customLayer2_.ovalRect = CGRectMake(scale2 , scale2, self.frame.size.width - 2*scale2,  self.frame.size.height - 2*scale2);
    customLayer2_.lineWidth = self.frame.size.width * 0.08;
    customLayer2_.colorLine = _colorCustomLayer2;
    customLayer2_.opacity = 0.4f;
    customLayer2_.ang1 = 195.0f;
    customLayer2_.ang2 = 285.0f;
    customLayer2_.ang3 = 105.0f;
    customLayer2_.ang4 = 15.0f;
    [customLayer2_ setNeedsDisplay];
    [customLayer2_ addAnimation:[self getRotaionAnimationClockwise:NO withDuration:MAXFLOAT * 0.4] forKey:@"layerTwo"];
    
    customLayer3_ = [[NGLoadingLayer alloc] init];
    [self.layer addSublayer:customLayer3_];
    customLayer3_.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale3 = self.frame.size.width * 0.35;
    customLayer3_.ovalRect = CGRectMake(scale3 , scale3, self.frame.size.width - 2*scale3,  self.frame.size.height - 2*scale3);
    customLayer3_.lineWidth = self.frame.size.width * 0.08;
    customLayer3_.colorLine = _colorCustomLayer3;
    customLayer3_.opacity = 0.8f;
    customLayer3_.ang1 = 190.0f;
    customLayer3_.ang2 = 280.0f;
    customLayer3_.ang3 = 100.0f;
    customLayer3_.ang4 = 10.0f;
    [customLayer3_ setNeedsDisplay];
    [customLayer3_ addAnimation:[self getRotaionAnimationClockwise:YES withDuration:MAXFLOAT * 0.2] forKey:@"layerThree"];

}

- (CABasicAnimation *)getRotaionAnimationClockwise:(BOOL)isClockwise withDuration:(float)duration {
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    if (isClockwise) {
        rotation.toValue = [NSNumber numberWithFloat:MAXFLOAT];
    } else {
        rotation.toValue = [NSNumber numberWithFloat:-MAXFLOAT];
    }
    rotation.duration = duration;
    rotation.removedOnCompletion = YES;
    return rotation;
}

- (void)addProgressLabel {
    if (_progressLabel) {
        if ([_progressLabel superview]) {
            [_progressLabel removeFromSuperview];
        }
        _progressLabel = nil;
    }
    _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height/2)];
    [self addSubview:_progressLabel];
    [_progressLabel setCenter:self.center];
    [_progressLabel setTextAlignment:NSTextAlignmentCenter];
    [_progressLabel setFont:[UIFont fontWithName:@"Futura" size:20]];
    
}

- (void)updateProgressLabelForValue:(float)_progress {
    NSString *_text = [NSString stringWithFormat:@"%.01f%%",_progress];
    [_progressLabel setText:_text];
}

@end
