//
//  HzPageControl.h
//  21DigitalPaperiPad
//
//  Created by kevin on 14-9-10.
//  Copyright (c) 2014年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HzPageControl : UIView

@property (nonatomic, retain) UIColor *hightlightedColor;
@property (nonatomic, retain) UIColor *normalColor;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) CGFloat progress;

@end
