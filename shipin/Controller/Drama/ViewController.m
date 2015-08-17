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
#import "SetViewController.h"
#import "LoginViewController.h"
#import "DramaDetialViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RGB(221, 221, 221)];
    bIsColl = FALSE;
    _currentPage = 1;

//    是否登录
    if (![[Config getLoginFlag ] isEqualToString:@"YES"])
    {
        LoginViewController *loginView = [[LoginViewController alloc ] init];
        [self.navigationController pushViewController:loginView animated:YES];
    }
    else
    {
        [self initViewCtrl];
        [self createSpreadOutButton];
        //加载视频数据1代表最新
        [self loadFindGoodDrama:1];
    }
}


#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{
    _reloading = YES;
    [self loadFindGoodDrama:_currentPage ];
}
- (void)doneLoadingTableViewData
{
    //  model should call this when its done loading
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_findTableView];
}

#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark EGORefreshTableHeaderDelegate Methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    [self reloadTableViewDataSource];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
    return [NSDate date]; // should return date data source was last changed
}

#pragma mark -上拉加载更多
-(void)addFooter
{
    __unsafe_unretained ViewController *vc = self;
    MJRefreshFooterView * footer = [MJRefreshFooterView footer];
    footer.scrollView = _findTableView;
    footer.beginRefreshingBlock = ^(MJRefreshBaseView* refreshView)
    {
        _currentPage = _currentPage +1;
        //加载更多数据
        if( _currentPage == 1 )
            [self loadFindGoodDrama:1];
        else
            [self loadFindGoodDrama:_currentPage ];
        [vc performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2.0];
    };
    _pullUpRefresh = footer;
}

-(void)doneWithView:(MJRefreshBaseView*)refreshView
{
    [_findTableView reloadData];
    [refreshView endRefreshing];
}

-(void) initViewCtrl
{
    self._navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar.png" StrTitle:@"剧库" ];
    [self.view addSubview:self._navigationBar];
    
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(10, 20, 22, 22)];
    [btnLogin setImage:[UIImage imageNamed:@"image_head.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonPersonalCenter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    btnGood = [[UIButton alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH/2, 40)];
    [btnGood setBackgroundColor:[UIColor blackColor]];
    [btnGood setTitle:@"发现好剧" forState:UIControlStateNormal];
    [btnGood setTitleColor:yellowRgb forState:UIControlStateNormal];
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

    //上拉刷新
    [self addFooter];
    //下拉刷新
    if (_refreshHeaderView == nil)
    {
        EGORefreshTableHeaderView *headRefreshTableview = [[EGORefreshTableHeaderView alloc]
                                                           initWithFrame:CGRectMake(0.0f, 0.0f - _findTableView.bounds.size.height,  _findTableView.frame.size.width, _findTableView.bounds.size.height)];
        headRefreshTableview.delegate = self;
        [_findTableView addSubview:headRefreshTableview];
        _refreshHeaderView = headRefreshTableview;
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    
}


#pragma mark  创建展开收起按钮
-(void) createSpreadOutButton
{
    btnSpreadOut = [[UIButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-50, btnGood.frame.size.height+btnGood.frame.origin.y, 40, 30)];
    [btnSpreadOut setBackgroundImage:[UIImage imageNamed:@"ico-up-arrow.png"] forState:UIControlStateNormal];
    [self.view addSubview:btnSpreadOut];
    [btnSpreadOut addTarget:self action:@selector(onButtonSpreadOut) forControlEvents:UIControlEventTouchUpInside];
    [btnSpreadOut setHidden:YES];
    
    //创建tableview
    _allTableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, btnSpreadOut.frame.origin.y+btnSpreadOut.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-70) style:UITableViewStylePlain];
    _allTableView.delegate = self;
    _allTableView.dataSource = self;
    _allTableView.scrollEnabled = YES;
    _allTableView.separatorColor = [UIColor clearColor];
    [_allTableView setBackgroundColor:[UIColor blackColor] ];
    [self.view addSubview:_allTableView];
    [_allTableView setHidden:YES];
    
}

-(void)onButtonSpreadOut
{
    if (bIsColl)
    {
        [btnSpreadOut setBackgroundImage:[UIImage imageNamed:@"ico-up-arrow.png"] forState:UIControlStateNormal];
        bIsColl = FALSE;
    }
    else
    {
        [btnSpreadOut setBackgroundImage:[UIImage imageNamed:@"ico-down-arrow.png"] forState:UIControlStateNormal];
        bIsColl = TRUE;
    }
}

-(void) onButtonPersonalCenter
{
    SetViewController *setView = [[SetViewController alloc ] init];
    [self.navigationController pushViewController:setView animated:YES];
}


//剧目类型选择
-(void) onButtonSelect:(UIButton*) sender
{
    //发现好剧
    if ( sender.tag == 100 )
    {
        [btnGood setTitleColor:yellowRgb forState:UIControlStateNormal];
        [btnAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_findTableView setHidden:NO];
        [_allTableView setHidden:YES];
        [btnSpreadOut setHidden:YES];
        //加载发现好剧数据
        [self loadFindGoodDrama:1];
        [_allTableView reloadData];
    }
    //全部剧目
    if ( sender.tag == 101 )
    {
        [btnGood setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnAll setTitleColor:yellowRgb forState:UIControlStateNormal];
        [_findTableView setHidden:YES];
        [_allTableView setHidden:NO];
        [btnSpreadOut setHidden:NO];
        
        [self loadFindGoodDrama:1];
        [_allTableView reloadData];
    }
}

#pragma mark 加载好剧数据
-(void) loadFindGoodDrama:(int )pageNumber
{
    [DramaServices pullDramaGoodData:pageNumber  success:^(NSArray *array)
    {
        self._arrayNewVideo =[[NSMutableArray alloc ] initWithArray:array];
        
        if (pageNumber  == 1 )
        {
            self._arrayVideo = [[NSMutableArray alloc]initWithArray:self._arrayNewVideo];
             [_findTableView reloadData];
        }
        else
        {
            if (self._arrayNewVideo.count == 0)
            {
                [Tool showWarningTip:@"没有更多数据!" view:self.view time:1];
            }
            if (self._arrayNewVideo.count != 0)
            {
                [self._arrayVideo addObjectsFromArray:self._arrayNewVideo];
            }
        }
        
    } failure:^(NSDictionary *error)
    {
        [Tool showWarningTip:@"请求数据失败" view:self.view time:2];
    }];
}

#pragma mark tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_findTableView])
    {
        return [self._arrayVideo count];
    }
    if ([tableView isEqual:_allTableView])
    {
        return [self._arrayVideo count]/2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell ;
    
    if ([tableView isEqual:_findTableView])
    {
        DramaModel *itemData = [[DramaModel alloc ] init];
        itemData = self._arrayVideo[indexPath.row];
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
        
        NSLog(@"%ld",(indexPath.row*2));
        
         dramaLeft  =[self._arrayVideo objectAtIndex:(indexPath.row*2)];
        //最后一条数组不能越界
        if ([self._arrayVideo count] == (indexPath.row*2+1) )
        {
            dramaRight=nil;
        }
        else
        {
            NSLog(@"%ld",(indexPath.row*2+1));
            dramaRight=[self._arrayVideo objectAtIndex:(indexPath.row*2+1)];
        }
        
        [cell setControlLeftData:dramaLeft rightData:dramaRight ];
        
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
        return 170;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DramaModel *itemData = [[DramaModel alloc ] init];
    itemData = self._arrayVideo[indexPath.row];
    
    DramaDetialViewController *dramaDetialView = [[DramaDetialViewController alloc ] init];
    dramaDetialView.dramaModle = itemData;
    [self.navigationController pushViewController:dramaDetialView animated:YES];
    
//    //打开播放器
//    MPMoviePlayerViewController *playerView =[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:itemData.trailerUrl]];
//    [self presentMoviePlayerViewControllerAnimated:playerView];
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
