//
//  BrowseViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/18.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "BrowseViewController.h"
#import "DramaDetialViewController.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _arrayBrowse = [[NSMutableArray alloc ] initWithCapacity:0];
    
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:self.strViewName  ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    _tableViewBrowse = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableViewBrowse.dataSource = self;
    _tableViewBrowse.delegate = self;
    _tableViewBrowse.separatorColor = RGB(221, 221, 221);
    [_tableViewBrowse setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableViewBrowse];
    
    [self loadNetWorkData];
}


-(void) loadNetWorkData
{
    if ( [self.strViewName isEqualToString:@"最近浏览" ] )
    {
//            [DramaServices pullDramaGoodData:1  success:^(NSArray *array)
//             {
//                 _arrayBrowse =[[NSMutableArray alloc ] initWithArray:array];
//                 [_tableViewBrowse reloadData];
//             } failure:^(NSDictionary *error)
//             {
//                 [Tool showWarningTip:@"请求我的预览数据失败" view:self.view time:2];
//             }];
    }
    if ( [self.strViewName isEqualToString:@"我的收藏" ] )
    {
        [UserService getCollections:^(NSArray *dramaArray)
        {
            _arrayBrowse =[[NSMutableArray alloc ] initWithArray:dramaArray];
             [_tableViewBrowse reloadData];
         } failure:^(NSDictionary *error)
         {
             [Tool showWarningTip:@"请求我的收藏数据失败" view:self.view time:2];
         }];

    }
}
-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayBrowse count]/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showCell = @"AllTableViewCell";
    AllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell] ;
    if (cell == nil)
    {
        cell = [[AllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSLog(@"%ld",(indexPath.row*2));
    
    dramaLeft  =[_arrayBrowse objectAtIndex:(indexPath.row*2)];
    //最后一条数组不能越界
    if ([_arrayBrowse count] == (indexPath.row*2+1) )
    {
        dramaRight=nil;
    }
    else
    {
        NSLog(@"%ld",(indexPath.row*2+1));
        dramaRight=[_arrayBrowse objectAtIndex:(indexPath.row*2+1)];
    }
    cell.delegate = self;
    [cell setControlLeftData:dramaLeft rightData:dramaRight ];

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)mViewControllerShouldPush:(DramaModel *)itemData
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
    DramaDetialViewController *dramaDetialView = [[DramaDetialViewController alloc ] init];
    dramaDetialView.nId = [[itemData.id stringValue] intValue];
    [self.navigationController pushViewController:dramaDetialView animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
