//
//  SystemMsgViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "SystemMsgViewController.h"
#import "SystemMsgTableViewCell.h"

@interface SystemMsgViewController ()

@end

@implementation SystemMsgViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arraySystemMsg = [[NSMutableArray alloc ] initWithCapacity:0];
    
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"系统消息" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    _tableViewSystemMsg = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableViewSystemMsg.dataSource = self;
    _tableViewSystemMsg.delegate = self;
    _tableViewSystemMsg.separatorColor = RGB(221, 221, 221);
    [_tableViewSystemMsg setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableViewSystemMsg];
    
    [self loadNetWorkData];
}


-(void) loadNetWorkData
{
//    MessageModel *systemMsgModle = [[MessageModel alloc ] init];
//    systemMsgModle.title = @"标题";
//    systemMsgModle.msg = @"消息内容";
//    systemMsgModle.createTime = @"2015年00月00日 11：11：11";
//   
//    [_arraySystemMsg addObject:systemMsgModle];
//    [_arraySystemMsg addObject:systemMsgModle];
//    [_tableViewSystemMsg reloadData];
    
    [UserService getMessages:^(NSArray *messageArray)
    {
        _arraySystemMsg =[[NSMutableArray alloc ] initWithArray:messageArray];
         [_tableViewSystemMsg reloadData];
        
    } failure:^(NSDictionary *error)
    {
        [Tool showWarningTip:@"加载数据失败" view:self.view time:1];
    }];
    
    
}
-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arraySystemMsg count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *systemMsgModle = [[MessageModel alloc ] init];
    
    static NSString *CellIdentifier = @"AttentionPeoperTableViewCell";
    SystemMsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[SystemMsgTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    systemMsgModle = [_arraySystemMsg objectAtIndex:indexPath.row];
    
    [cell setItemText:systemMsgModle];
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
