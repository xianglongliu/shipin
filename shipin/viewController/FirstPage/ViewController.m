//
//  ViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "ViewController.h"
#import "FindTableViewCell.h"
#import "AllTableViewCell.h"
#import "SetViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    bIsColl = FALSE;
    arrCheck = [NSArray arrayWithObjects:@"全部",@"剧情",@"喜剧",@"自制",@"爱情",@"战争", @"全部",@"美国",@"大陆",@"香港",@"台湾",@"韩国", @"全部",@"2015",@"2014",@"2013",@"2012",@"2011",nil];
    
    self._navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"剧库" ];
    [self.view addSubview:self._navigationBar];
    
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(10, 20, 40, 40)];
    [btnLogin setImage:[UIImage imageNamed:@"Default-568h@2x.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    btnGood = [[UIButton alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH/2, 40)];
    [btnGood setBackgroundColor:[UIColor blackColor]];
    [btnGood setTitle:@"发现好剧" forState:UIControlStateNormal];
    [btnGood setTitleColor:RGB(239, 190, 0) forState:UIControlStateNormal];
    btnGood.titleLabel.font = [UIFont systemFontOfSize:14];
    btnGood.tag = 100;
    [btnGood addTarget:self action:@selector(onButtonSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnGood];
    
     btnAll = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/2, TABBAR_HEIGHT, SCREEN_WIDTH/2, 40)];
    [btnAll setBackgroundColor:[UIColor blackColor]];
    [btnAll setTitle:@"全部剧目" forState:UIControlStateNormal];
    [btnAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAll addTarget:self action:@selector(onButtonSelect:) forControlEvents:UIControlEventTouchUpInside];
    btnAll.tag = 101;
    btnAll.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview: btnAll];
  
    //创建tableview
    _findTableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, btnGood.frame.origin.y+btnGood.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-40) style:UITableViewStylePlain];
    _findTableView.delegate = self;
    _findTableView.dataSource = self;
    _findTableView.scrollEnabled = YES;
    _findTableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_findTableView];
    
//    可以展开view
    _viewColl = [[UIView alloc ] initWithFrame:CGRectMake(0, btnGood.frame.origin.y+btnGood.frame.size.height, SCREEN_WIDTH, 50)];
    [_viewColl setBackgroundColor:RGB(231, 231, 231) ];
    [self.view addSubview:_viewColl];
    [_viewColl setHidden:YES];
    
    [self addSearchCondition];
    
    UIButton *btnColl = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 10, 33, 33)];
    [btnColl addTarget:self action:@selector(onButtonColl) forControlEvents:UIControlEventTouchUpInside];
    [btnColl setImage:[UIImage imageNamed:@"Default-568h@2x.png"] forState:UIControlStateNormal];
    [_viewColl addSubview: btnColl];
    
    
    //创建tableview
    _allTableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, _viewColl.frame.origin.y+_viewColl.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-40) style:UITableViewStylePlain];
    _allTableView.delegate = self;
    _allTableView.dataSource = self;
    _allTableView.scrollEnabled = YES;
    _allTableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_allTableView];
    [_allTableView setHidden:YES];
    
}

-(void) onButtonLogin
{
    SetViewController *setView = [[SetViewController alloc ] init];
    [self.navigationController pushViewController:setView animated:YES];
}
//创建搜索条件控件
-(void) addSearchCondition
{
    //搜索框
    _searchBar = [[UISearchBar alloc ] initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH-20, 30)];
    [_searchBar setBackgroundColor:[UIColor clearColor]];
    [_viewColl addSubview:_searchBar];
    //最新
     btnNewOnLine = [[UIButton alloc ] initWithFrame:CGRectMake(10, _searchBar.frame.origin.y+_searchBar.frame.size.height+10, (SCREEN_WIDTH-30)/3, 20)];
    [btnNewOnLine setBackgroundColor:RGB(239, 190, 0)];
    [btnNewOnLine setTitle:@"新上线" forState:UIControlStateNormal];
    btnNewOnLine.titleLabel.font =[UIFont systemFontOfSize:13];
    btnNewOnLine.layer.cornerRadius = 3;
    btnNewOnLine.layer.masksToBounds = YES;
    btnNewOnLine.tag = 1000;
    [btnNewOnLine addTarget:self action:@selector(onNewLine_hot_coll:) forControlEvents:UIControlEventTouchUpInside];
    [_viewColl addSubview:btnNewOnLine];
    //最热门
     btnNewHot = [[UIButton alloc ] initWithFrame:CGRectMake(btnNewOnLine.frame.origin.x+btnNewOnLine.frame.size.width+5, _searchBar.frame.origin.y+_searchBar.frame.size.height+10, (SCREEN_WIDTH-30)/3, 20)];
    [btnNewHot setBackgroundColor:RGB(204, 204, 204)];
    [btnNewHot setTitle:@"最热门" forState:UIControlStateNormal];
    btnNewHot.titleLabel.font =[UIFont systemFontOfSize:13];
    btnNewHot.layer.cornerRadius = 3;
    btnNewHot.layer.masksToBounds = YES;
    btnNewHot.tag = 1001;
    [btnNewHot addTarget:self action:@selector(onNewLine_hot_coll:) forControlEvents:UIControlEventTouchUpInside];
    [_viewColl addSubview:btnNewHot];
    //收藏多
     btnNewCollect = [[UIButton alloc ] initWithFrame:CGRectMake(btnNewHot.frame.origin.x+btnNewHot.frame.size.width+5, _searchBar.frame.origin.y+_searchBar.frame.size.height+10, (SCREEN_WIDTH-30)/3, 20)];
    [btnNewCollect setBackgroundColor:RGB(204, 204, 204)];
    [btnNewCollect setTitle:@"收藏多" forState:UIControlStateNormal];
    btnNewCollect.titleLabel.font =[UIFont systemFontOfSize:13];
    btnNewCollect.layer.cornerRadius = 3;
    btnNewCollect.layer.masksToBounds = YES;
    btnNewCollect.tag = 1002;
    [btnNewCollect addTarget:self action:@selector(onNewLine_hot_coll:) forControlEvents:UIControlEventTouchUpInside];
    [_viewColl addSubview:btnNewCollect];
    
    for (int nRow = 0 ; nRow < 3 ; nRow++)
    {
        for (int  nCol = 0; nCol < 6;  nCol++ )
        {
            int Index;
            
            if (nRow == 0 )
                Index =nCol;
            else
                Index = nCol+6*nRow;
            
            btnCheck[Index] = [[UIButton alloc ] initWithFrame:CGRectMake(10+nCol*(SCREEN_WIDTH-20)/6,btnNewCollect.frame.origin.y+btnNewCollect.frame.size.height+4+nRow*28,(SCREEN_WIDTH-20)/6,20 )];
            if (nCol == 0)
            {
                [btnCheck[Index] setBackgroundColor:RGB(239, 190, 0)];
                [btnCheck[Index] setTitleColor:RGB(255, 255 ,255 ) forState:UIControlStateNormal];
            }
            else
            {
                [btnCheck[Index] setBackgroundColor:[UIColor clearColor] ];
                [btnCheck[Index] setTitleColor:RGB(204, 204,204) forState:UIControlStateNormal];
            }
            
            [btnCheck[Index] setTitle:arrCheck[Index]forState:UIControlStateNormal];
            NSLog(@"%d",Index);
            btnCheck[Index].titleLabel.font =[UIFont systemFontOfSize:13];
            btnCheck[Index].layer.cornerRadius = 3;
            btnCheck[Index].layer.masksToBounds = YES;
            [_viewColl addSubview:btnCheck[Index]];
        }
    }
    
}

//剧目类型选择
-(void) onButtonSelect:(UIButton*) sender
{
    //发现好剧
    if ( sender.tag == 100 )
    {
        [btnGood setTitleColor:RGB(239, 190, 0) forState:UIControlStateNormal];
        [btnAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_findTableView setHidden:NO];
        [_allTableView setHidden:YES];
        [_viewColl setHidden:YES];
    }
    //全部剧目
    if ( sender.tag == 101 )
    {
        [btnGood setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnAll setTitleColor:RGB(239, 190, 0) forState:UIControlStateNormal];
        [_findTableView setHidden:YES];
        [_allTableView setHidden:NO];
        [_viewColl setHidden:NO];
    }
}

//新上线，最热门，收藏多
-(void) onNewLine_hot_coll:(UIButton*) sender
{
    //新上线
    if ( [sender isEqual:btnNewOnLine] )
    {
        [btnNewOnLine setBackgroundColor:RGB(239, 190, 0) ];
        [btnNewHot setBackgroundColor:RGB(204, 204, 204) ];
        [btnNewCollect setBackgroundColor:RGB(204, 204, 204) ];
       
    }
    //热门
    if ( [sender isEqual:btnNewHot] )
    {
        [btnNewOnLine setBackgroundColor:RGB(204, 204, 204) ];
        [btnNewHot setBackgroundColor:RGB(239, 190, 0) ];
        [btnNewCollect setBackgroundColor:RGB(204, 204, 204) ];
    }
    //收藏
    if ( [sender isEqual:btnNewCollect] )
    {
        [btnNewOnLine setBackgroundColor:RGB(204, 204, 204) ];
        [btnNewHot setBackgroundColor:RGB(204, 204, 204) ];
        [btnNewCollect setBackgroundColor:RGB(239, 190, 0) ];
    }
    
}




//收起展开
-(void)onButtonColl
{
    //展开
    if (!bIsColl)
    {
        _viewColl.frame = CGRectMake(0, btnGood.frame.origin.y+btnGood.frame.size.height, SCREEN_WIDTH, 200);
        //创建tableview
        _allTableView.frame = CGRectMake(0, _viewColl.frame.origin.y+_viewColl.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-190);
                         
                         
        bIsColl = TRUE;
    }
    else//收起
    {
        _viewColl.frame = CGRectMake(0, btnGood.frame.origin.y+btnGood.frame.size.height, SCREEN_WIDTH, 50);
        //创建tableview
        _allTableView.frame = CGRectMake(0, _viewColl.frame.origin.y+_viewColl.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-40);
        
        bIsColl = FALSE;
    }
}


#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell ;//=[tableView dequeueReusableCellWithIdentifier:showCell] ;;
    
    FilmModel *itemData = [[FilmModel alloc ] init];
    itemData = self._arrayVideo[indexPath.row];
    
    if ([tableView isEqual:_findTableView])
    {
        static NSString *showCell = @"FindTableViewCell";
        FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell] ;
        if (cell == nil)
        {
            cell = [[FindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell setControlData:itemData];
         return cell;
    }
    //全部剧目
    if ([tableView isEqual:_allTableView])
    {
        static NSString *showCell = @"AllTableViewCell";
        AllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell] ;
        if (cell == nil)
        {
            cell = [[AllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell setControlData:itemData];
         return cell;
    }
   
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_findTableView])
    {
        return 135;
    }
    if ([tableView isEqual:_allTableView])
    {
        return (SCREEN_WIDTH-30)/2;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmModel *itemData = [[FilmModel alloc ] init];
    itemData = self._arrayVideo[indexPath.row];
    //打开播放器
//    MPMoviePlayerViewController *playerView =[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:itemData.strItem5]];
//    [self presentMoviePlayerViewControllerAnimated:playerView];
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
