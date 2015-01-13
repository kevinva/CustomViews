//
//  HzPageControl.m
//  21DigitalPaperiPad
//
//  Created by kevin on 14-9-10.
//  Copyright (c) 2014年 Kevin. All rights reserved.
//

#import "HzPageControl.h"

NSInteger const kHzPageControlBaseTagItemView = 2699;

@interface HzPageControl()

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) CGFloat lastProgress;

@end

@implementation HzPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.currentPage = 0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews{
    CGFloat spacerWidth = 1.0f;
    CGFloat itemWidth = (self.frame.size.width - (_pageCount - 1) * spacerWidth) / _pageCount;
    for(NSInteger i = 0; i < _pageCount; i++){
        UIView *itemView = [self viewWithTag:kHzPageControlBaseTagItemView + i];
        if(!itemView){
            UIView *itemBgView = [[UIView alloc] initWithFrame:CGRectMake((itemWidth + spacerWidth) * i, 0.0f, itemWidth, self.frame.size.height)];
            itemBgView.backgroundColor = _normalColor;
            [self addSubview:itemBgView];
            [itemBgView release];
            
            itemView = [[UIView alloc] initWithFrame:itemBgView.frame];
            itemView.tag = kHzPageControlBaseTagItemView + i;
            [self addSubview:itemView];
            [itemView release];
        }
        
        itemView.backgroundColor = _hightlightedColor;
        if(i == _currentPage){
            itemView.alpha = 1.0f;
        }
        else{
            itemView.alpha = 0.0f;
        }
    }
}

- (void)setProgress:(CGFloat)progress{
    if(progress < 0.0f || progress > 1.0f){
        return;
    }
    
    CGFloat subProgress = 1.0f / (_pageCount - 1);
    
    NSInteger page = -1;
    CGFloat currentItemAlpha = -1;
    CGFloat nextItemAlpha = -1;
    if(progress >= _lastProgress){
        page = progress / subProgress;
        currentItemAlpha = (subProgress * (page + 1) - progress) / subProgress;
        nextItemAlpha = (progress - subProgress * page) / subProgress;
        
        UIView *currentItemView = [self viewWithTag:kHzPageControlBaseTagItemView + page];
        currentItemView.alpha = currentItemAlpha;
        
        UIView *nextItemView = [self viewWithTag:kHzPageControlBaseTagItemView + page + 1];
        nextItemView.alpha = nextItemAlpha;
        
        NSLog(@"%s, to R: page=%d, currentAlpha=%f, nextAlpha=%f", __FUNCTION__, page, currentItemAlpha, nextItemAlpha);
    }
    else{
        page = progress / subProgress;
        currentItemAlpha = (progress - subProgress * page) / subProgress;
        nextItemAlpha = (subProgress * (page + 1) - progress) / subProgress;
        
        UIView *currentItemView = [self viewWithTag:kHzPageControlBaseTagItemView + page + 1];
        currentItemView.alpha = currentItemAlpha;
        
        UIView *nextItemView = [self viewWithTag:kHzPageControlBaseTagItemView + page];
        nextItemView.alpha = nextItemAlpha;
        
        NSLog(@"%s, to L: page=%d, currentAlpha=%f, nextAlpha=%f", __FUNCTION__, page, currentItemAlpha, nextItemAlpha);
    }
    
    self.lastProgress = progress;
    self.currentPage = page;
}

- (void)dealloc{
    self.hightlightedColor = nil;
    self.normalColor = nil;
    
    [super dealloc];
}

@end
