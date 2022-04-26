//
//  UILabel+Create.h
//  CategoryDemo
//
//  Created by Stormer on 2019/9/3.
//  Copyright © 2019 stormer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Create)

+(UILabel *)createLabelWithTitle:(NSString *)title Font:(CGFloat)font TextAligment:(NSTextAlignment)textAligment textColor:(UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END
