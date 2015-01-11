//
//  NGLoadingView.h
//  NGLoadingIndicator
//
//  Created by Nitin Gupta on 20/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGLoadingLayer;

@interface NGLoadingView : UIView {
    UILabel *_progressLabel;
}

@property (strong,nonatomic) UIColor *color;

- (id)initWithFrame:(CGRect)frame withLoadingColor:(UIColor *)color ;
- (void)updateProgressLabelForValue:(float)_progress;

@end
