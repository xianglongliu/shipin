//
//  ViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "ViewController.h"
#import "VideoTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self._navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"剧库" ];
    [self.view addSubview:self._navigationBar];
    
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
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, btnGood.frame.origin.y+btnGood.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-40) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
}

-(void) onButtonSelect:(UIButton*) sender
{
    //发现好剧
    if ( sender.tag == 100 )
    {
         [btnGood setTitleColor:RGB(239, 190, 0) forState:UIControlStateNormal];
          [btnAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    //全部剧目
    if ( sender.tag == 101 )
    {
        [btnGood setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnAll setTitleColor:RGB(239, 190, 0) forState:UIControlStateNormal];
    }
}

#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmModel *itemData = [[FilmModel alloc ] init];
    itemData = self._arrayVideo[indexPath.row];
    
    static NSString *showCell = @"VideoTableViewCell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell] ;
    if (cell == nil)
    {
        cell = [[VideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setControlData:itemData];
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmModel *itemData = [[FilmModel alloc ] init];
    itemData = self._arrayVideo[indexPath.row];
    //打开播放器
//    MPMoviePlayerViewController *playerView =[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:itemData.strItem5]];
//    [self presentMoviePlayerViewControllerAnimated:playerView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
