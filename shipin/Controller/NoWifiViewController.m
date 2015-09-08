//
//  NoWifiViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "NoWifiViewController.h"

#define  posx       80

@interface NoWifiViewController ()

@end

@implementation NoWifiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication  sharedApplication] setStatusBarHidden:NO];
    // Do any additional setup after loading the view.
    arrayHeight = [[NSArray alloc ] initWithObjects:@"30",@"40",@"15",@"30",@"80",@"15",@"30",@"40",@"40",@"40",@"40",@"40",@"40",@"40",@"40",@"40",@"40",@"40",@"15",@"30",@"40",@"80", nil];
    _dramaModel = [[DramaModel alloc ] init];
    [self initViewCtrl];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PublishshowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PublishHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    
}

//
#pragma mark    弹出键盘，显示菜单
- (void)PublishshowKeyboard:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    [UIView beginAnimations:@"animal" context:nil];
    [UIView setAnimationDuration:0.25];
    _tableView.frame = CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-kbSize.height);
    [UIView commitAnimations];
}

- (void)PublishHideKeyboard:(NSNotification *)notification
{
    [UIView beginAnimations:@"animal" context:nil];
    [UIView setAnimationDuration:0.25];
    _tableView.frame = CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT);
    [UIView commitAnimations];
}



-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"添加剧目" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    
    _tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = RGB(221, 221, 221);
    [_tableView setBackgroundColor:RGBA(238, 238, 238, 1)];
    [self.view addSubview:_tableView];

    
}

-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark tableview function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16+6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AttentionPeoperTableViewCell";
    UITableViewCell *cell ;//= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        [cell setBackgroundColor:[UIColor whiteColor]];

    }
    if (indexPath.row == 0)
    {
         cell.textLabel.text = @"剧目名称";
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        return cell;
    }
    if (indexPath.row == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"剧目名称";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldDramaName = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldDramaName setPlaceholder:@"请输入剧目名称"];
        [_textFieldDramaName setFont:[UIFont systemFontOfSize:12]];
        [_textFieldDramaName setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldDramaName];
        
         [_textFieldDramaName addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 2)
    {
         cell.textLabel.text = @"";
        [cell setBackgroundColor:RGB(238, 238, 238)];
        return cell;
    }
    if (indexPath.row == 3)
    {
        cell.textLabel.text = @"剧情简介";
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        
        return cell;
    }
    if (indexPath.row == 4)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"";
        [cell setBackgroundColor:[UIColor whiteColor]];
        _textViewBrief = [[UITextField alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-100, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textViewBrief setPlaceholder:@"请使用100字以内描述剧情"];
        [_textViewBrief setFont:[UIFont systemFontOfSize:12]];
        [_textViewBrief setTextAlignment:NSTextAlignmentLeft];
        [cell addSubview:_textViewBrief];
        
        [_textViewBrief addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 5)
    {
        [cell setBackgroundColor:RGB(238, 238, 238)];
        return cell;
    }
//    if (indexPath.row == 6)
//    {
//        cell.textLabel.text = @"影片图集";
//        [cell.textLabel setTextColor:RGB(153, 153, 153)];
//        return cell;
//    }
//    if (indexPath.row == 7)
//    {
//        cell.textLabel.text = @"";
//        [cell setBackgroundColor:[UIColor whiteColor]];
//        return cell;
//    }
//    if (indexPath.row == 8)
//    {
//        [cell setBackgroundColor:RGB(238, 238, 238)];
//        return cell;
//    }
    if (indexPath.row == 6)
    {
        cell.textLabel.text = @"项目信息";
        [cell setBackgroundColor:RGB(246, 246, 246)];
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        return cell;
    }
    if (indexPath.row == 7)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"导演";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        
        _textFieldDirector = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldDirector setPlaceholder:@"请输入导演"];
        [_textFieldDirector setFont:[UIFont systemFontOfSize:12]];
        [_textFieldDirector setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldDirector];
        
         [_textFieldDirector addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        return cell;
    }
    if (indexPath.row == 8)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"编剧";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        
        _textFieldBj = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldBj setPlaceholder:@"请输入编剧"];
        [_textFieldBj setFont:[UIFont systemFontOfSize:12]];
        [_textFieldBj setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldBj];
        
         [_textFieldStaring addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        return cell;
    }
    if (indexPath.row == 9)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"主演";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        
        _textFieldStaring = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldStaring setPlaceholder:@"请输入主演"];
        [_textFieldStaring setFont:[UIFont systemFontOfSize:12]];
        [_textFieldStaring setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldStaring];
        
        [_textFieldStaring addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        return cell;
    }

    if (indexPath.row == 10)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"地区";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        
        _textFieldDistrict = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldDistrict setPlaceholder:@"请输上映地区"];
        [_textFieldDistrict setFont:[UIFont systemFontOfSize:12]];
        [_textFieldDistrict setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldDistrict];
        
         [_textFieldDistrict addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        return cell;
    }
    if (indexPath.row == 11)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"语言";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        
        _textFieldLanguage = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldLanguage setPlaceholder:@"请输入语言种类"];
        [_textFieldLanguage setFont:[UIFont systemFontOfSize:12]];
        [_textFieldLanguage setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldLanguage];
         [_textFieldLanguage addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 12)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"首播";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldPremiere = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldPremiere setPlaceholder:@"请输入首播时间"];
        [_textFieldPremiere setFont:[UIFont systemFontOfSize:12]];
        [_textFieldPremiere setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldPremiere];
         [_textFieldPremiere addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 13)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"集数";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldJs = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldJs setPlaceholder:@"请输入集数"];
        [_textFieldJs setFont:[UIFont systemFontOfSize:12]];
        [_textFieldJs setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldJs];
        [_textFieldJs addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 14)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"出品单位";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldCpdw = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldCpdw setPlaceholder:@"请输入出品单位"];
        [_textFieldCpdw setFont:[UIFont systemFontOfSize:12]];
        [_textFieldCpdw setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldCpdw];
        [_textFieldCpdw addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 15)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"制片单位";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldZpdw = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldZpdw setPlaceholder:@"请输入制片单位"];
        [_textFieldZpdw setFont:[UIFont systemFontOfSize:12]];
        [_textFieldZpdw setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldZpdw];
        [_textFieldZpdw addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 16)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"开机时间";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldKjsj = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldKjsj setPlaceholder:@"请输入开机时间"];
        [_textFieldKjsj setFont:[UIFont systemFontOfSize:12]];
        [_textFieldKjsj setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldKjsj];
        [_textFieldKjsj addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 17)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"杀青时间";
        [cell.textLabel setTextColor:RGB(34, 34, 34)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        _textFieldSqsj = [[UITextField alloc ] initWithFrame:CGRectMake(posx, 0, SCREEN_WIDTH-130, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldSqsj setPlaceholder:@"请输入杀青时间"];
        [_textFieldSqsj setFont:[UIFont systemFontOfSize:12]];
        [_textFieldSqsj setTextAlignment:NSTextAlignmentRight];
        [cell addSubview:_textFieldSqsj];
        [_textFieldSqsj addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
    if (indexPath.row == 18)
    {
        cell.textLabel.text = @"";
        return cell;
    }
    if (indexPath.row == 19)
    {
        cell.textLabel.text = @"推荐语";
        [cell.textLabel setTextColor:RGB(153, 153, 153)];
        [cell setBackgroundColor:[UIColor whiteColor]];
        return cell;
    }
    if (indexPath.row == 20)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _textFieldRecommend = [[UITextField alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-100, [[arrayHeight objectAtIndex:indexPath.row] integerValue])];
        [_textFieldRecommend setPlaceholder:@"请在15字以内描述剧情亮点"];
        [_textFieldRecommend setFont:[UIFont systemFontOfSize:12]];
        [_textFieldRecommend setTextAlignment:NSTextAlignmentLeft];
        [cell addSubview:_textFieldRecommend];

         [_textFieldRecommend addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        return cell;
    }
    
    if (indexPath.row == 21)
    {
        UIButton *btnAdd = [[UIButton alloc ] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 40)];
        [btnAdd setTitle:@"确认添加" forState:UIControlStateNormal];
        btnAdd.titleLabel.font = [UIFont systemFontOfSize:14];
        [btnAdd  setBackgroundColor:yellowRgb];
        btnAdd.layer.masksToBounds = YES;
        btnAdd.layer.cornerRadius = 3;
        [btnAdd addTarget:self action:@selector(onButtonAdd) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnAdd];
        return cell;
    }
    return cell;
}

-(void) onButtonAdd
{
    [UserService sendPublish:_dramaModel success:^(Boolean *boolean)
    {
        [Tool showSuccessTip:@"发布成功" view:self.view time:1];
        
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count] -3)] animated:YES];
        
    } failure:^(NSString *error)
    {
         [Tool showSuccessTip:@"发布失败" view:self.view time:1];
    }];
     
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [arrayHeight[indexPath.row] integerValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hidekebord];
}
//uitextfiled 输入判断
- (void)textFieldEditChanged:(UITextField *)textField
{
    [UIView beginAnimations:@"animal" context:nil];
    [UIView setAnimationDuration:0.25];
    if([textField isEqual:_textFieldDramaName])//剧目名称
    {
        _dramaModel.name =textField.text;
    }
    if([textField isEqual:_textViewBrief])//剧情简介
    {
        _dramaModel.brief =textField.text;
    }
    if([textField isEqual:_textFieldDirector])//导演
    {
        _dramaModel.director =textField.text;
        self.view.frame = CGRectMake(0, -250, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    if([textField isEqual:_textFieldStaring])//主演
    {
        _dramaModel.staring =textField.text;
    }
    if([textField isEqual:_textFieldDistrict])//地区
    {
        _dramaModel.district =textField.text;
    }
    if([textField isEqual:_textFieldLanguage])//语言
    {
        _dramaModel.language =textField.text;
    }
    if([textField isEqual:_textFieldPremiere])//首播
    {
        _dramaModel.premiere =textField.text;
    }
    if([textField isEqual:_textFieldRecommend])//推荐语
    {
        _dramaModel.recommend =textField.text;
    }
    
    if([textField isEqual:_textFieldBj])//编剧
    {
//        _dramaModel.staring =textField.text;
    }
    if([textField isEqual:_textFieldJs])//集数
    {
        _dramaModel.episodes =textField.text;
    }
    if([textField isEqual:_textFieldCpdw])//
    {
        _dramaModel.presentation =textField.text;
    }
    if([textField isEqual:_textFieldZpdw])//
    {
        _dramaModel.distribution =textField.text;
    }
    if([textField isEqual:_textFieldKjsj])//
    {
        _dramaModel.boot =textField.text;
    }
    if([textField isEqual:_textFieldSqsj])//
    {
        _dramaModel.wrap =textField.text;
    }
    
    [UIView commitAnimations];
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hidekebord];
}

-(void) hidekebord
{
    [UIView beginAnimations:@"animal" context:nil];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [UIView commitAnimations];
    
    [_textFieldDramaName resignFirstResponder];
    [_textViewBrief resignFirstResponder];
    [_textFieldDirector resignFirstResponder];
    [_textFieldStaring resignFirstResponder];
    [_textFieldDistrict resignFirstResponder];
    [_textFieldLanguage resignFirstResponder];
    [_textFieldPremiere resignFirstResponder];
    [_textFieldRecommend resignFirstResponder];

}
- (void)didReceiveMemoryWarning
    {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
