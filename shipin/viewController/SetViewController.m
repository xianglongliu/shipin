//
//  SetViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "SetViewController.h"
#import "HeadTableViewCell.h"
#import "PersonInfoViewController.h"


@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建tableview
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.scrollEnabled = YES;
    [_tableView setBackgroundColor:[UIColor grayColor]];
    self.automaticallyAdjustsScrollViewInsets = FALSE;
    [self.view addSubview:_tableView];
    
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(10, 25, 50, 25)];
    [btnLogin setImage:[UIImage imageNamed:@"ico-return.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
}

-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 4;
    }
    else
    {
       return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        switch (indexPath.section)
        {
            case 0:
                if(indexPath.row == 0)
                {
                    static NSString *showCell = @"FindTableViewCell";
                    cell = [[HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                if(indexPath.row == 1)
                {
                    cell.textLabel.text =  @"我的发布";
                }
                if(indexPath.row == 2)
                {
                    cell.textLabel.text =  @"系统消息";
                }
                if(indexPath.row == 3)
                {
                    cell.textLabel.text =  @"最近浏览";
                }
                
                break;
            case 1:
                if(indexPath.row == 0)
                {
                    cell.textLabel.text =  @"分享给好友";
                }
                if(indexPath.row == 1)
                {
                    cell.textLabel.text =  @"意见反馈";
                }
                if(indexPath.row == 2)
                {
                    cell.textLabel.text =  @"使用帮助";
                }
                if(indexPath.row == 3)
                {
                    cell.textLabel.text =  @"去给应用评分";
                }
                if(indexPath.row == 4)
                {
                    cell.textLabel.text =  @"关于我们";
                }

                break;
            default:
                break;
        }
  
    return cell;

    }
     return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.01f;
    else
        return 5;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 7;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if (indexPath.row == 0)
            return 190;
        else
            return 40;
    }
    else
        return 40;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            PersonInfoViewController *personInfoView = [[PersonInfoViewController alloc ] init];
            [self.navigationController pushViewController:personInfoView animated:YES];
        }
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
