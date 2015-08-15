//
//  EditPersonViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "EditPersonViewController.h"
#import "TextTableViewCell.h"
#import "ModifyUserinfoViewController.h"

@interface EditPersonViewController ()

@end

@implementation EditPersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor] ];
    
    mutableArray = [[NSMutableArray alloc ] initWithCapacity:0];
    
    NSArray *arrLeft = [NSArray arrayWithObjects:@"头像",@"姓名",@"个人简介",@"公司名称",@"公司职位",@"公司邮箱",@"联系电话", nil];
    NSArray *arrRight = [NSArray arrayWithObjects:netWorkUrl,@"王大",@"good good study",@"百度",@"ceo",@"323@qq.com",@"14567890-=", nil];
    
    for(int i = 0 ; i < [arrLeft count]; i++)
    {
        TextModel * tModle = [[TextModel alloc ] init];
        tModle.strLeftName = [arrLeft objectAtIndex:i];
        tModle.strRightName = [arrRight objectAtIndex:i];
        
        [mutableArray addObject:tModle];
    }

    
    [self initViewCtrl];
    
}

-(void) initViewCtrl
{
    self._navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"个人信息" ];
    [self.view addSubview:self._navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UITableView *tableViewPersonInfo = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    tableViewPersonInfo.dataSource = self;
    tableViewPersonInfo.delegate = self;
    tableViewPersonInfo.separatorColor = [UIColor clearColor];
    [tableViewPersonInfo setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:tableViewPersonInfo];
    
    
    UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, SCREEN_WIDTH-40, 40)];
    [btnSave setTitle:@"保存填写" forState:UIControlStateNormal];
    btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSave  setBackgroundColor:yellowRgb];
    btnSave.layer.masksToBounds = YES;
    btnSave.layer.cornerRadius = 3;
    [btnSave addTarget:self action:@selector(saveUserInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
}

//保存用户修改的用户信息
-(void) saveUserInfo
{
    
}

#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TextTableViewCell";
    TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[TextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    //有头像
    if (indexPath.row == 0)
    {
        TextModel * tModle = [[TextModel alloc ] init];
        tModle =  mutableArray[indexPath.row];
        [cell setLableText:tModle viewName:@"EditPersonViewController" cellHegith:70];
    }
    else
    {
        TextModel * tModle = [[TextModel alloc ] init];
        tModle =  mutableArray[indexPath.row];
        [cell setLableText:tModle viewName:@"EditPersonViewController" cellHegith:40];
    }
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 70;
    else
        return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //头像
    if (indexPath.row == 0)
    {
        FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
        mediaPicker.mediaType = 0;
        mediaPicker.editMode = 0;
        mediaPicker.delegate = self;
        [mediaPicker showFromView:self.view];
    }
    else
    {
        TextModel * tModle = [[TextModel alloc ] init];
        tModle =  mutableArray[indexPath.row];
        
        ModifyUserinfoViewController * modifyUserinfoView = [[ModifyUserinfoViewController alloc ] init];
        modifyUserinfoView._strName = tModle.strRightName;
        modifyUserinfoView._strSelItem = tModle.strLeftName;
        [self.navigationController pushViewController:modifyUserinfoView animated:YES];
    }
}


#pragma mark - FSMediaPicker Delegate Methods
-(void)mediaPickerCameraAuth{
    if (!_MediaAlert)
    {
        _MediaAlert = [[UIAlertView alloc]
                       initWithTitle:@"提示"
                       message:@"请在[系统设置]中打开相机服务"
                       delegate:self
                       cancelButtonTitle:@"取消"
                       otherButtonTitles:@"确定", nil];
    }
    [_MediaAlert show];
}

- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    if (mediaPicker.editMode == FSEditModeNone)
    {
        [self._imageViewHeadImage setImage:mediaInfo.originalImage ];
    }
    else
    {
        UIImage *img = mediaPicker.editMode == FSEditModeCircular? mediaInfo.circularEditedImage:mediaInfo.editedImage;
        [self._imageViewHeadImage setImage:img ];
    }
}



-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
