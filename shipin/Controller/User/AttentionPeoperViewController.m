//
//  AttentionPeoperViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AttentionPeoperViewController.h"
#import "AttentionPeoperTableViewCell.h"


@interface AttentionPeoperViewController ()

@end

@implementation AttentionPeoperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayAPeoper = [[NSMutableArray alloc ] initWithCapacity:0];
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"我关注的人" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    _tableViewPersonInfo = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableViewPersonInfo.dataSource = self;
    _tableViewPersonInfo.delegate = self;
    _tableViewPersonInfo.separatorColor = RGB(221, 221, 221);
    [_tableViewPersonInfo setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableViewPersonInfo];

    [self loadNetWorkData];
}


-(void) loadNetWorkData
{
    [UserService getFollows:^(NSArray *followArray)
    {
        arrayAPeoper = [[NSMutableArray alloc ] initWithArray:followArray];
    } failure:^(NSDictionary *error)
    {
        [Tool showWarningTip:@"读取数据失败" view:self.view time:1];
    }];
    [_tableViewPersonInfo reloadData];
}
-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayAPeoper count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserModel *userModle = [[UserModel alloc ] init];
    
    static NSString *CellIdentifier = @"AttentionPeoperTableViewCell";
    AttentionPeoperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[AttentionPeoperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    userModle = [arrayAPeoper objectAtIndex:indexPath.row];
    [cell setItemText:userModle];
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
