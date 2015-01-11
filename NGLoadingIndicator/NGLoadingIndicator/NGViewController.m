//
//  NGViewController.m
//  NGLoadingIndicator
//
//  Created by Nitin Gupta on 20/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"
#import "NGLoadingView.h"

@interface NGViewController () {
    NSTimer *ticker;
    float value;
    NGLoadingView *loadingView;
}
- (void)updateViewBackgroundColor;
- (void)showLoadingView;
- (void)removeLoadingView;
- (BOOL)isLoadingView;
- (void)updateTicker:(id)sender;
@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [_startStopButton setTitle:@"Show Loading View" forState:UIControlStateNormal];
    [_startStopButton setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewBackgroundColor {
    [UIView animateWithDuration:3.0 animations:^{
        CGFloat redLevel	= rand() / (float) RAND_MAX;
        CGFloat greenLevel	= rand() / (float) RAND_MAX;
        CGFloat blueLevel	= rand() / (float) RAND_MAX;
        
        self.view.backgroundColor = [UIColor colorWithRed: redLevel
                                                    green: greenLevel
                                                     blue: blueLevel
                                                    alpha: 1.0];
    } completion:^(BOOL finished) {

    }];
}
#pragma mark - IBActon Related
-(IBAction)startStopLoadingAction:(id)sender {
    if ([self isLoadingView]) {
        [self removeLoadingView];
        [_startStopButton setTitle:@"Show Loading View" forState:UIControlStateNormal];
        
    } else {
        [self showLoadingView];
        [self updateViewBackgroundColor];
        [_startStopButton setHidden:YES];
    }
}

#pragma mark - Loading View Related
- (void)showLoadingView {
    CGRect _rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    loadingView = [[NGLoadingView alloc] initWithFrame:_rect withLoadingColor:[UIColor purpleColor]];
    [loadingView setBackgroundColor:[UIColor clearColor]];
    [loadingView setCenter:self.view.center];
    [[self view] addSubview:loadingView];
    
    ticker = [NSTimer scheduledTimerWithTimeInterval:0.50f target:self selector:@selector(updateTicker:) userInfo:nil repeats:YES];
}

- (void)removeLoadingView {
    if (loadingView) {
        if ([loadingView superview]) {
            [loadingView removeFromSuperview];
        }
        loadingView = nil;
    }
    
    if (ticker) {
        if ([ticker isValid]) {
            [ticker invalidate];
        }
        ticker = nil;
    }
    [_startStopButton setHidden:NO];
}

- (BOOL)isLoadingView {
    if (loadingView) {
        return YES;
    } else {
        return NO;
    }
}

- (void)updateTicker:(NSTimer*)sender {
    float changeByValue = rand() / (float) RAND_MAX;
    if (value < 100.0f) {
        value += changeByValue;
        [loadingView updateProgressLabelForValue:value];
        if ((int)value%3 == 0) {
            [self updateViewBackgroundColor];
        }
    } else {
        if ([self isLoadingView]) {
            [self removeLoadingView];
        }
    }
}

@end
