//
//  UIView+HYViewKit.h
//  JKCategories-Demo
//
//  Created by HY on 2017/4/11.
//  Copyright © 2017年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HYViewKit)

/**
 *  获取所有子视图
 *
 *  @return 所有子视图数组
 */
-(NSMutableArray *)hy_getAllSubviews;
/**
 *  设置所有子视图为随机色
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的子视图
 */
-(NSMutableArray *)hy_setAllSubviewsBackgroundColorRandom:(CGFloat)alpha;

/**
 *  为所有子视图加上border red
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的子视图
 */
-(NSMutableArray *)hy_setAllSubviewsBorderRed;
/**
 *  获取所有父视图(!注意不是子视图)
 *
 *  @return 所有父视图数组
 */
-(NSMutableArray *)hy_getAllSuperviews;
/**
 *  设置所有父视图为随机色(!注意不是子视图)
 *
 *  @param alpha 随机色透明度
 *
 *  @return 所有的父视图
 */
-(NSMutableArray *)hy_setAllSupviewsBackgroundColorRandom:(CGFloat)alpha;
/**
 *  在所有子视图中获取视图树种最上层的一个类型的view
 *
 *  @param cls view类型
 *
 *  @return 获取到的view
 */
-(UIView *)hy_getSubviewOfClass:(Class)cls;
@end
