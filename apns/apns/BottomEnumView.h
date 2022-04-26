//
//  BottomEnumView.h
//  WebCall
//
//  Created by SR Zhang on 2021/1/29.
//  Copyright © 2021 Stormer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"
#import "UILabel+Create.h"

typedef  enum{
    BottomAlertType=0,
}BottomEnumStyle;


@protocol BottomEnumViewDelegate <NSObject>

-(void)selBottomEnumIndex:(NSUInteger)index style:(BottomEnumStyle)style;

@end

@interface BottomEnumView : UIView<UITableViewDelegate,UITableViewDataSource>

-(id)initWithFrame:(CGRect)frame title:(NSString *)titleStr cancel:(NSString *)cancelStr content:(NSArray *)contentArr style:(BottomEnumStyle)style;

@property(strong,nonatomic)NSArray * contentArr;
@property(assign,nonatomic)BottomEnumStyle style;
@property(strong,nonatomic)UIView * wholeView;
@property(strong,nonatomic)UIView * bgView;
@property(strong,nonatomic)UILabel * titleLab;
@property(strong,nonatomic)UIView * cancelBgView;
@property(strong,nonatomic)UIView * lineView;
@property(strong,nonatomic)UILabel * cancelLab;
@property(strong,nonatomic)UITableView * tableView;

@property(assign,nonatomic) id<BottomEnumViewDelegate>delegate;

@end


