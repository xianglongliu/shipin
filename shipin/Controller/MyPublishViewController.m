//
//  MyPublishViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "MyPublishViewController.h"
#import "AddPublishViewController.h"

@interface MyPublishViewController ()

@end

@implementation MyPublishViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _arrayDrama = [[NSMutableArray alloc ] initWithCapacity:0];
    
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"我的发布" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UIButton *btnAdd = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 25, 45, 22)];
    [btnAdd setImage:[UIImage imageNamed:@"btn_addpublish.png"] forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(onButtonAddDrama) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    UILabel *labelTip = [[UILabel alloc ] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/3, SCREEN_WIDTH, 30)];
    [labelTip setText:@"开始发布您的第一步剧吧"];
    [labelTip setBackgroundColor:[UIColor clearColor] ];
    [labelTip setTextColor:RGB(102, 102, 102)];
    [labelTip setFont:[UIFont systemFontOfSize:14]];
    [labelTip setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelTip];
    
    UIButton *btnAddDrama = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/4, labelTip.frame.origin.y+labelTip.frame.size.height+20, SCREEN_WIDTH/2, 40)];
    btnAddDrama.layer.masksToBounds = YES;
    btnAddDrama.layer.cornerRadius = 3;
    [btnAddDrama setBackgroundColor:yellowRgb];
    btnAddDrama.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnAddDrama setTitle:@"添加剧目" forState:UIControlStateNormal];
    [btnAddDrama addTarget:self action:@selector(onButtonAddDrama) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAddDrama];
    
    //先加载数据
     [self loadNetWorkData];
    
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = RGB(221, 221, 221);
    [_tableView setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableView];
    
    //如果我的发布为空
    if ([_arrayDrama count] <= 0)
    {
        [_tableView setHidden:YES];
    }
    [_tableView reloadData];
}


-(void) loadNetWorkData
{
    MyPublishModle *myPublishModle = [[MyPublishModle alloc ] init];
    myPublishModle.headImage = netWorkUrl;
    myPublishModle.title = @"消息内容";
    myPublishModle.content = @"2015年00月00日 11：11：11";
    myPublishModle.rendCount = @"2000";
    myPublishModle.attentionCount = @"2015";
    
    [_arrayDrama addObject:myPublishModle];
}


//添加发布内容
- (void)onButtonAddDrama
{
    AddPublishViewController *addPublishView = [[AddPublishViewController alloc ] init];
    [self.navigationController pushViewController:addPublishView animated:YES];
}

//返回
- (void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayDrama count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MessageModel *systemMsgModle = [[MessageModel alloc ] init];
    
    static NSString *CellIdentifier = @"PublishCellTableViewCell";
    PublishCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[PublishCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    systemMsgModle = [_arraySystemMsg objectAtIndex:indexPath.row];
    
//    [cell setItemText:systemMsgModle];
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREEN_HEIGHT-TABBAR_HEIGHT)/3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
