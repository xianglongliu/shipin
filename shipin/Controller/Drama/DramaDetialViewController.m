//
//  DramaDetialViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "DramaDetialViewController.h"
#import "PersonInfoViewController.h"
#import "UIWebViewLoad.h"

@interface DramaDetialViewController ()

@end

@implementation DramaDetialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _arrayDramaDetial = [[NSMutableArray alloc ] initWithCapacity:0];
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"剧目详情" ];
    [self.view addSubview:navigationBar];
    //返回
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];

    //分享
    UIButton *btnShare = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-45, 20, 25, 25)];
    [btnShare setImage:[UIImage imageNamed:@"btn_share.png"] forState:UIControlStateNormal];
    [btnShare addTarget:self action:@selector(onButtonShare) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShare];
    
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor clearColor] ;
    [_tableView setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableView];
    
    
    [self loadNetWorkData];
}
//添加收藏
-(void)onButtonColloction
{
    [UserService addCollection:self.nId success:^(Boolean *boolean)
    {
        [Tool showWarningTip:@"收藏成功" view:self.view time:1];
 
    } failure:^(NSString *error)
     {
        [Tool showWarningTip:error view:self.view time:1];
    }];
}

-(void) onButtonShare
{
    
}


-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) loadNetWorkData
{
    [DramaServices getDramaDetail:self.nId  success:^(id dramaModel)
     {
         dramaModle = dramaModel;
         [_tableView reloadData];
         
    } failure:^(NSDictionary *error)
     {
         [Tool showWarningTip:@"加载剧目详情失败" view:self.view time:1];
    }];
}

#pragma mark tableview function

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( clickIndex == 0)
    {
        return 4+[dramaModle.posters count ]+1;
    }
    else if( clickIndex == 1)
    {
        return 4+1;
    }
    else if ( clickIndex == 2)
    {
        return 2+[dramaModle.posters count ]+1;
    }
    else
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetialHeadTableViewCell";
    UITableViewCell *cell;//= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (dramaModle == nil)
    {
        return cell;
    }
    if(indexPath.row == 0 )
    {
        DetialHeadTableViewCell* cell = [[DetialHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setCtrlText:dramaModle];
        return cell;
    }
    else if(indexPath.row == 1 )
    {
         btnIntroduction = [[UIButton alloc ] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH/3, 40)];
        [btnIntroduction setBackgroundColor:yellowRgb];
        [btnIntroduction setTitle:@"剧情简介" forState:UIControlStateNormal];
        btnIntroduction.titleLabel.font = [UIFont systemFontOfSize:13];
        [btnIntroduction addTarget:self action:@selector(onBtnSwitch:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnIntroduction];
        
        btnProjectInfo= [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 10, SCREEN_WIDTH/3, 40)];
        [btnProjectInfo setBackgroundColor:grayRgb];
        [btnProjectInfo setTitle:@"项目信息" forState:UIControlStateNormal];
        btnProjectInfo.titleLabel.font = [UIFont systemFontOfSize:13];
        [btnProjectInfo addTarget:self action:@selector(onBtnSwitch:) forControlEvents:UIControlEventTouchUpInside];
        [btnProjectInfo setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [cell addSubview:btnProjectInfo];
        
        btnConnect = [[UIButton alloc ] initWithFrame:CGRectMake((SCREEN_WIDTH/3)*2, 10, SCREEN_WIDTH/3, 40)];
        [btnConnect setBackgroundColor:grayRgb];
        [btnConnect setTitle:@"相关资料" forState:UIControlStateNormal];
        btnConnect.titleLabel.font = [UIFont systemFontOfSize:13];
        [btnConnect addTarget:self action:@selector(onBtnSwitch:) forControlEvents:UIControlEventTouchUpInside];
        [btnConnect setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [cell addSubview:btnConnect];
        
        
        if( clickIndex == 1)
        {
            [btnIntroduction setBackgroundColor:grayRgb];
            [btnIntroduction setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
            [btnProjectInfo setBackgroundColor:yellowRgb];
            [btnProjectInfo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnConnect setBackgroundColor:grayRgb];
            [btnConnect setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        }
        if( clickIndex == 2)
        {
            [btnIntroduction setBackgroundColor:grayRgb];
            [btnIntroduction setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
            [btnProjectInfo setBackgroundColor:grayRgb];
            [btnProjectInfo setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
            [btnConnect setBackgroundColor:yellowRgb];
            [btnConnect setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        return cell;
    }
    else if(indexPath.row == 2 )
    {
        if( clickIndex == 0)
        {
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             [cell setIntroductionText:@"基本剧情简介" headImage:nil imageHeight:0];
            return cell;
        }
        if( clickIndex == 1)//项目信息
        {
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setProjectInfo:dramaModle];
            return cell;
        }
        if( clickIndex == 2)//相关资料
        {
            if ( [dramaModle.posters count] == indexPath.row - 1 )
            {
                UITableViewCell* cellBtn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                cellBtn.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 40)];
                [btnSave setTitle:@"加入收藏" forState:UIControlStateNormal];
                btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
                [btnSave  setBackgroundColor:yellowRgb];
                btnSave.layer.masksToBounds = YES;
                btnSave.layer.cornerRadius = 3;
                [btnSave addTarget:self action:@selector(onButtonColloction) forControlEvents:UIControlEventTouchUpInside];
                [cellBtn addSubview:btnSave];
                return cellBtn;
            }
            
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            DramaRelativesModel *dramaRelativesModel =dramaModle.dramaRelatives[indexPath.row - 2];
            [cell setRelatedData:dramaRelativesModel];
            return cell;
        }
        
    }
    else if(indexPath.row == 3 )//简介
    {
        if( clickIndex == 0)
        {
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setIntroductionText:dramaModle.brief headImage:nil imageHeight:0];
            return cell;
        }
        if( clickIndex == 1)//相似剧集
        {
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setSimilarDrama:[[NSMutableArray alloc ] initWithArray:dramaModle.similarities]];
            return cell;
        }
        if( clickIndex == 2)//相关资料
        {
            if ( [dramaModle.posters count] == indexPath.row - 3 )
            {
                UITableViewCell* cellBtn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                cellBtn.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 40)];
                [btnSave setTitle:@"加入收藏" forState:UIControlStateNormal];
                btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
                [btnSave  setBackgroundColor:yellowRgb];
                btnSave.layer.masksToBounds = YES;
                btnSave.layer.cornerRadius = 3;
                [btnSave addTarget:self action:@selector(onButtonColloction) forControlEvents:UIControlEventTouchUpInside];
                [cellBtn addSubview:btnSave];
                return cellBtn;
            }
            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            DramaRelativesModel *dramaRelativesModel =dramaModle.dramaRelatives[indexPath.row - 2];
            [cell setRelatedData:dramaRelativesModel];
            return cell;
        }
    }
    else
    {
         if( clickIndex == 0)//剧情简介
         {
             if ( [dramaModle.posters count] == indexPath.row - 4 )
             {
                 UITableViewCell* cellBtn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                 cellBtn.selectionStyle = UITableViewCellSelectionStyleNone;

                 UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 40)];
                 [btnSave setTitle:@"加入收藏" forState:UIControlStateNormal];
                 btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
                 [btnSave  setBackgroundColor:yellowRgb];
                 btnSave.layer.masksToBounds = YES;
                 btnSave.layer.cornerRadius = 3;
                 [btnSave addTarget:self action:@selector(onButtonColloction) forControlEvents:UIControlEventTouchUpInside];
                 [cellBtn addSubview:btnSave];
                return cellBtn;
             }
             //图片
             DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             
             DramaPostersModel *posterModle =dramaModle.posters[indexPath.row - 4];
             NSURL *url =[Tool stringMerge:posterModle.poster];
             [cell setIntroductionText:@"" headImage:url imageHeight:SCREEN_WIDTH-106];
             return cell;
         }
        if( clickIndex == 1)//相关资料
        {
   
            UITableViewCell* cellBtn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cellBtn.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 40)];
            [btnSave setTitle:@"加入收藏" forState:UIControlStateNormal];
            btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
            [btnSave  setBackgroundColor:yellowRgb];
            btnSave.layer.masksToBounds = YES;
            btnSave.layer.cornerRadius = 3;
            [btnSave addTarget:self action:@selector(onButtonColloction) forControlEvents:UIControlEventTouchUpInside];
            [cellBtn addSubview:btnSave];
            return cellBtn;
            
        }
        if( clickIndex == 2)//相关资料
        {
            
            if ( [dramaModle.posters count] == indexPath.row - 3 )
            {
                UITableViewCell* cellBtn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                cellBtn.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 40)];
                [btnSave setTitle:@"加入收藏" forState:UIControlStateNormal];
                btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
                [btnSave  setBackgroundColor:yellowRgb];
                btnSave.layer.masksToBounds = YES;
                btnSave.layer.cornerRadius = 3;
                [btnSave addTarget:self action:@selector(onButtonColloction) forControlEvents:UIControlEventTouchUpInside];
                [cellBtn addSubview:btnSave];
                return cellBtn;
            }

            DramaDetialTableViewCell* cell = cell = [[DramaDetialTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            DramaRelativesModel *dramaRelativesModel =dramaModle.dramaRelatives[indexPath.row - 2];
            [cell setRelatedData:dramaRelativesModel];
            return cell;
        }
    }
    return cell;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return SCREEN_WIDTH-40;
    }
    if (indexPath.row == 1)
    {
        return 50;
    }
    if (indexPath.row == 2)
    {
        if( clickIndex == 0)
        {
            return 40;
        }
        if( clickIndex == 1)
        {
            return 160; //项目信息cell 高度
        }
        if( clickIndex == 2)
        {
            return 50;
        }
        
    }
    if (indexPath.row == 3)
    {
        if( clickIndex == 0)
        {
            return  [Tool CalcString:dramaModle.brief fontSize:[UIFont systemFontOfSize:FontSize] andWidth:SCREEN_WIDTH-20].height+20;
        }
        if( clickIndex == 1)
        {
            return  200;
        }
        if( clickIndex == 2)
        {
            return 50;
        }
        if ( [dramaModle.posters count] == indexPath.row - 4 )
        {
            return 40;
        }
        
    }
    else
    {
        if( clickIndex == 2)
        {
            return 50;
        }
        else if( [dramaModle.posters count] == indexPath.row - 4 )
        {
            return 40;
        }
        else
            return  SCREEN_WIDTH-100;
    }
    return 0;
}


-(void) onBtnSwitch:(UIButton*)btn
{
    if ( [btn isEqual:btnIntroduction] )
    {
         clickIndex = 0;
         [_tableView reloadData];
        
        [btnIntroduction setBackgroundColor:yellowRgb];
        [btnIntroduction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnProjectInfo setBackgroundColor:grayRgb];
        [btnProjectInfo setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [btnConnect setBackgroundColor:grayRgb];
        [btnConnect setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
       
    }
    if ( [btn isEqual:btnProjectInfo] )
    {
        clickIndex = 1;
        [_tableView reloadData];
        
        [btnIntroduction setBackgroundColor:grayRgb];
        [btnIntroduction setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [btnProjectInfo setBackgroundColor:yellowRgb];
        [btnProjectInfo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnConnect setBackgroundColor:grayRgb];
        [btnConnect setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        
    }
    if ( [btn isEqual:btnConnect] )
    {
        clickIndex = 2;
        [_tableView reloadData];
        
        [btnIntroduction setBackgroundColor:grayRgb];
        [btnIntroduction setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [btnProjectInfo setBackgroundColor:grayRgb];
        [btnProjectInfo setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [btnConnect setBackgroundColor:yellowRgb];
        [btnConnect setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        PersonInfoViewController *personInfoView = [[PersonInfoViewController alloc ] init];
        [self.navigationController pushViewController:personInfoView animated:YES];
    }
    if (clickIndex == 2)
    {
        DramaRelativesModel *dramaRelativesModel =dramaModle.dramaRelatives[indexPath.row - 2];
        UIWebViewLoad *webView = [[UIWebViewLoad alloc ] init];
        webView.dramaRelativesModel = dramaRelativesModel;
        [self.navigationController pushViewController:webView animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
