//
//  UILabel+Create.m
//  CategoryDemo
//
//  Created by Stormer on 2019/9/3.
//  Copyright © 2019 stormer. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)

+(UILabel *)createLabelWithTitle:(NSString *)title Font:(CGFloat)font TextAligment:(NSTextAlignment)textAligment textColor:(UIColor *)textColor{
    
    UILabel * lab = [[UILabel alloc]init];
  
    lab.text= title;
    lab.textAlignment = textAligment;
    lab.textColor = textColor;
    [lab setFont:[UIFont systemFontOfSize:font]];
    
    
    
    return lab;
}

@end
