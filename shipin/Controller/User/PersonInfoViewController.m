//
//  PersonInfoViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "TextTableViewCell.h"
#import "EditPersonViewController.h"
#import "SetViewHeadTableViewCell.h"

@interface PersonInfoViewController ()

@end

@implementation PersonInfoViewController

-(void)viewWillAppear:(BOOL)animated
{
     [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    mutableArray = [[NSMutableArray alloc ] initWithCapacity:0];
    
    [self loadUserInfo];
}

-(void)initViewCtrl
{
    UITableView *tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT+20) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = RGB(221, 221, 221);
    [tableView setBackgroundColor:RGB(238, 238, 238)];
    [self.view addSubview:tableView];
    //back button
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnLogin setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];

   
}

-(void) loadUserInfo
{
    [UserService getUserDetail:self._uId success:^(UserModel *userModel)
     {
         self.userModel =userModel;
         
         NSArray *arrLeft = [NSArray arrayWithObjects:@"个人简介",@"公司名称",@"公司职位",@"公司邮箱",@"联系电话", nil];
         NSArray *arrRight = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@",self.userModel.brief],
                              [NSString stringWithFormat:@"%@",self.userModel.corporation],
                              [NSString stringWithFormat:@"%@",self.userModel.position],
                              [NSString stringWithFormat:@"%@",self.userModel.email],
                              [NSString stringWithFormat:@"%@",self.userModel.mobile], nil];
         
         for(int i = 0 ; i < [arrLeft count]; i++)
         {
             TextModel * tModle = [[TextModel alloc ] init];
             tModle.strLeftName = [arrLeft objectAtIndex:i];
             tModle.strRightName = [arrRight objectAtIndex:i];
             
             [mutableArray addObject:tModle];
         }
         
         [self initViewCtrl];
         
     } failure:^(NSDictionary *error)
     {
         [Tool showWarningTip:@"获取用户信息失败" view:self.view time:1];
     }];
}


#pragma mark tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row == 0)
    {
        SetViewHeadTableViewCell* cell = [[SetViewHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SetViewHeadTableViewCell" ];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:RGB(238, 238, 238)];
        [cell setHeadCellData:self.userModel cellName:@"personinfo"];
        
        UIButton *btnFollow = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/1.7f, 210, 40, 25)];
        [btnFollow setTitle:@"关注" forState:UIControlStateNormal];
        [btnFollow setTitleColor:yellowRgb forState:UIControlStateNormal];
        btnFollow.titleLabel.font = [UIFont systemFontOfSize:12];
        [btnFollow addTarget:self action:@selector(onButtonFollow) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnFollow];
        
        UIButton *btnFollowImage = [[UIButton alloc ] initWithFrame:CGRectMake(btnFollow.frame.origin.x-10, 217, 12, 12)];
        [btnFollowImage setImage:[UIImage imageNamed:@"btn_floow.png"] forState:UIControlStateNormal];
        [btnFollowImage addTarget:self action:@selector(onButtonFollow) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnFollowImage];
        
        
        return cell;
    }
    //add edit button
    if (indexPath.row == 1)
    {
        UIButton *btnEdit = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 30)];
        [btnEdit setTitle:@"编辑" forState:UIControlStateNormal];
        [btnEdit setTitleColor:yellowRgb forState:UIControlStateNormal];
        btnEdit.titleLabel.font = [UIFont systemFontOfSize:12];
        [btnEdit addTarget:self action:@selector(onButtonEdit) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnEdit];
        
        cell.textLabel.text = @"基本信息";
        [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        return cell;
    }
    else if(indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 )
    {
        TextModel * tModle = [[TextModel alloc ] init];
        tModle =  mutableArray[indexPath.row-2];
        
        static NSString *showCell = @"TextTableViewCell";
        TextTableViewCell * cell = [[TextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLableText:tModle viewName:@"PersonInfoViewController" cellHegith:40];
        return cell;
    }
    else if (indexPath.row == 7)
    {
         [cell setBackgroundColor:RGB(238, 238, 238)];
    }
    else if (indexPath.row == 8)
    {
        cell.textLabel.text = @"发布的剧目";
        [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        return cell;
    }
    else if (indexPath.row == 10)
    {
        UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 40)];
        [btnSave setTitle:@"联系发布者" forState:UIControlStateNormal];
        btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
        [btnSave  setBackgroundColor:yellowRgb];
        btnSave.layer.masksToBounds = YES;
        btnSave.layer.cornerRadius = 3;
        [btnSave addTarget:self action:@selector(onButtonTel) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnSave];
        return cell;
    }
    
    return cell;
}

-(void)onButtonTel
{
    if ([self.userModel.mobile length]> 0)
    {
        NSString *phoneNum = self.userModel.mobile;// 电话号码
        NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
        if ( !phoneCallWebView )
        {
            phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        }
        [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    }
}


#pragma  mark  关注
-(void)onButtonFollow
{
    [UserService addFollow:[[self.userModel.id stringValue ] intValue] success:^(Boolean *boolean) {
        [Tool showWarningTip:@"关注成功" view:self.view time:1];
    } failure:^(NSString *error) {
        [Tool showWarningTip:error view:self.view time:1];
    }];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 250;
    else if (indexPath.row == 1)
        return 30;
    else if (indexPath.row == 7)
        return 13;
    else if (indexPath.row == 8)
        return 30;
    else if (indexPath.row == 9)
        return 170;
    else if (indexPath.row == 10)
        return 80;
    else
        return 40;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void) onButtonEdit
{
    EditPersonViewController *editPersonView = [[EditPersonViewController alloc ] init];
    editPersonView._uId = [[self.userModel.id stringValue] intValue];
    [self.navigationController pushViewController:editPersonView animated:YES];
}

-(void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
