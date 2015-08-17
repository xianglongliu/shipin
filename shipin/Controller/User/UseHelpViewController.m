//
//  UseHelpViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "UseHelpViewController.h"

@interface UseHelpViewController ()

@end

@implementation UseHelpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self initViewCtrl];
    [self readHelpContent];
}

-(NSString *) readHelpContent
{
    NSError *error;
    NSString *textFileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"use" ofType:@"txt"]
                                                           encoding:NSUTF8StringEncoding
                                                            error:&error];
    if (textFileContents == nil)
    {
        NSLog(@"Error reading text file. %@", [error localizedFailureReason]);
    }
    return textFileContents;
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"使用帮助" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor =[UIColor clearColor] ;
    [_tableView setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableView];

}

- (void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma make tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0 )
    {
        [cell.textLabel setText:@"使用帮助"];
        [cell.textLabel setFont:[UIFont boldSystemFontOfSize:13] ];
    }
    if (indexPath.row == 1 )
    {
        [cell.textLabel setText:[self readHelpContent]];
        [cell.textLabel setFont:[UIFont systemFontOfSize:12] ];
        [cell.textLabel setTextColor:RGB(102, 102, 102)];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 )
    {
        return 40;
    }
    else
    {
        return [Tool CalcString: [self readHelpContent] fontSize:[UIFont systemFontOfSize:12] andWidth:SCREEN_WIDTH-40].height;
    }
    return 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
