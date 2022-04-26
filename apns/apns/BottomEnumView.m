//
//  BottomEnumView.m
//  WebCall
//
//  Created by SR Zhang on 2021/1/29.
//  Copyright © 2021 Stormer. All rights reserved.
//

#import "BottomEnumView.h"
#import <Masonry/Masonry.h>


@implementation BottomEnumView

-(id)initWithFrame:(CGRect)frame title:(NSString *)titleStr cancel:(NSString *)cancelStr content:(NSArray *)contentArr style:(BottomEnumStyle)style{
    
    if (self = [super initWithFrame:frame]) {
     
        _style = style;
        _contentArr = contentArr;
        _wholeView = [[UIView alloc]initWithFrame:WholeScreen];
        [_wholeView setBackgroundColor:[UIColor blackColor]];
        [_wholeView setAlpha:KWholeBgAlpha];
        [self addSubview:_wholeView];
        
        CGFloat bgHeight = [self countViewHeighArr:contentArr title:titleStr];
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.bottom.offset(-kSafeBottomHeight);
            make.height.equalTo(@(bgHeight));
        }];
        
        _titleLab = [UILabel createLabelWithTitle:titleStr Font:20 TextAligment:NSTextAlignmentLeft textColor:KDarkBtnTitleColor];
        [_titleLab setFont:[UIFont fontWithName:CentraleSansMedium size:20]];
        [_bgView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(16);
            make.right.offset(-16);
            make.height.equalTo(@30);
        }];
        
        _cancelBgView = [[UIView alloc]init];
        [_bgView addSubview:_cancelBgView];
        [_cancelBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.height.equalTo(@48);
        }];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelClick)];
        [_cancelBgView addGestureRecognizer:tap];
        
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:KNormalBorderColor];
        [_cancelBgView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.offset(0);
            make.height.equalTo(@1.
                                );
        }];
        
        _cancelLab = [UILabel createLabelWithTitle:cancelStr Font:16 TextAligment:NSTextAlignmentCenter textColor:KMainColor];
        [_cancelLab setFont:[UIFont fontWithName:CentraleSansBold size:16]];
        [_cancelBgView addSubview:_cancelLab];
        [_cancelLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.centerY.equalTo(_cancelBgView);
            make.height.equalTo(@30);
        }];
        
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_bgView addSubview:_tableView];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        [_bgView addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.offset(56);
            make.height.equalTo(@(48*contentArr.count));
        }];
        
        
        
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identify = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_contentArr[indexPath.row]];
    //[cell.textLabel setFont:[UIFont fontWithName:CentraleSansBook size:16]];
    
    [cell.textLabel setTextColor:KBlackColor];
    [cell setBackgroundColor:KWhiteColor];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [_delegate selBottomEnumIndex:indexPath.row style:_style];
    [self removeFromSuperview];

}

- (void)cancelClick {
    
     [self removeFromSuperview];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
 
    return _contentArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}


-(CGFloat)countViewHeighArr:(NSArray *)arr title:(NSString *)titleStr{
    
    CGFloat height = 0;
    if (titleStr.length >0) {
        height = height+56;
    }else{
        height = height+10;
    }
    
    height = height + 48 * arr.count;
    height = height + 8;
    height = height+48;
    return height;
}

@end
