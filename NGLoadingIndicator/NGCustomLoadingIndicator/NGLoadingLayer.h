//
//  NGLoadingLayer.h
//  NGLoadingIndicator
//
//  Created by Nitin Gupta on 20/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface NGLoadingLayer : CALayer {

}

@property (nonatomic, assign) CGRect ovalRect;
@property (nonatomic, assign) int lineWidth;
@property (nonatomic, assign) UIColor *colorLine;
@property (nonatomic, assign) float ang1;
@property (nonatomic, assign) float ang2;
@property (nonatomic, assign) float ang3;
@property (nonatomic, assign) float ang4;

@end
