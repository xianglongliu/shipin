//
//  GuideViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/9/2.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "GuideViewController.h"
#import "LoginViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewWillAppear:(BOOL)animated {
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


- (void)viewDidLoad {
    _isOut = NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _arrayImage = [NSArray arrayWithObjects:@"guide_image1.png", @"guide_image2.png", @"guide_image3.png", @"guide_image4.png", @"guide_image5.png", nil];

    _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH * _arrayImage.count, 0);
    _scrollview.pagingEnabled = YES;
    _scrollview.scrollEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.delegate = self;
    [self.view addSubview:_scrollview];

    for (int i = 0; i < _arrayImage.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        img.image = [UIImage imageNamed:_arrayImage[i]];
        [_scrollview addSubview:img];


    }


    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT - 70, SCREEN_WIDTH - 20, 20)];
    [_pageCtrl setBackgroundColor:[UIColor clearColor]];
    _pageCtrl.numberOfPages = [_arrayImage count];
    _pageCtrl.currentPage = 0;
    [self.view addSubview:_pageCtrl];
}

#pragma mark scrollView的代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > ([_arrayImage count] - 1) * SCREEN_WIDTH) {
        _isOut = YES;
    }
}

//停止滑动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    _pageCtrl.currentPage = index;
    if (_isOut) {
        LoginViewController *loginView = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:loginView animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
