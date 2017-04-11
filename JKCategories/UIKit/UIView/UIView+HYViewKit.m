//
//  UIView+HYViewKit.m
//  JKCategories-Demo
//
//  Created by HY on 2017/4/11.
//  Copyright © 2017年 www.skyfox.org. All rights reserved.
//

#import "UIView+HYViewKit.h"

@implementation UIView (HYViewKit)

/**
 *  获取所有子视图
 *
 *  @return 所有子视图数组
 */
-(NSMutableArray *)hy_getAllSubviews
{
    NSMutableArray *allSubviews = [NSMutableArray array];
    NSMutableArray *curSubviews = [NSMutableArray arrayWithArray:self.subviews];
    while (curSubviews.count!=0) {
        NSMutableArray *temSubviews = [NSMutableArray array];
        for (UIView *view in curSubviews) {
            [allSubviews addObject:view];
            if (view.subviews.count !=0) {
                [temSubviews addObjectsFromArray:view.subviews];
            }
        }
        [curSubviews removeAllObjects];
        [curSubviews addObjectsFromArray:temSubviews];
    }
    [allSubviews addObject:self];
    return allSubviews;
}

/**
 *  设置所有子视图为随机色
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的子视图
 */
-(NSMutableArray *)hy_setAllSubviewsBackgroundColorRandom:(CGFloat)alpha
{
    NSMutableArray *allSubviews = [self hy_getAllSubviews];
    for (UIView *view in allSubviews) {
        if ([view respondsToSelector:@selector(setBackgroundColor:)]) {
            view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
                                                   green:arc4random()%255/255.0
                                                    blue:arc4random()%255/255.0
                                                   alpha:alpha];
        }
        
    }
    return allSubviews;
}

/**
 *  为所有子视图加上border red
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的子视图
 */
-(NSMutableArray *)hy_setAllSubviewsBorderRed
{
    NSMutableArray *allSubviews = [self hy_getAllSubviews];
    for (UIView *view in allSubviews) {
        if ([view isKindOfClass:[UIView class]]) {
            view.layer.borderColor = [UIColor redColor].CGColor;
            view.layer.borderWidth = 1.0;
        }
    }
    return allSubviews;
}
/**
 *  获取所有父视图(!注意不是子视图)
 *
 *  @return 所有父视图数组
 */
-(NSMutableArray *)hy_getAllSuperviews{
    NSMutableArray *allSuperviews = [NSMutableArray array];
    UIView *tmpView = self;
    while (tmpView.superview) {
        [allSuperviews addObject:tmpView.superview];
        tmpView = tmpView.superview;
    }
    return allSuperviews;
}

/**
 *  设置所有父视图为随机色(!注意不是子视图)
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的父视图
 */
-(NSMutableArray *)hy_setAllSupviewsBackgroundColorRandom:(CGFloat)alpha
{
    NSMutableArray *allSuperviews = [self hy_getAllSuperviews];
    for (UIView *view in allSuperviews) {
        if ([view respondsToSelector:@selector(setBackgroundColor:)]) {
            view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
                                                   green:arc4random()%255/255.0
                                                    blue:arc4random()%255/255.0
                                                   alpha:alpha];
            view.layer.borderColor = [UIColor redColor].CGColor;
            view.layer.borderWidth = 1.0;
        }
    }
    return allSuperviews;
}


/**
 *  在所有子视图中获取视图树种最上层的一个类型的view
 *
 *  @param cls view类型
 *
 *  @return 获取到的view
 */
-(UIView *)hy_getSubviewOfClass:(Class)cls{
    NSMutableArray *subs = [NSMutableArray arrayWithArray:self.subviews];
    while (subs.count) {
        NSArray *subsTmp = [NSArray arrayWithArray:subs];[subs removeAllObjects];
        for (UIView *subview in subsTmp) {
            if ([subview isKindOfClass:cls]) {
                return subview;
            }
            [subs addObjectsFromArray:subview.subviews];
        }
    }
    return nil;
}

@end
