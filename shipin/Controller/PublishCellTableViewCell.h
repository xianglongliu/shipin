//
//  PublishCellTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPublishModle.h"

@interface PublishCellTableViewCell : UITableViewCell
{
    UIImageView         *_imageViewfilmLeft;
    UIImageView         *_imageViewHeadLeft;
    UILabel             *_labelTitleLeft;
    UILabel             *_labelContentLeft;
    //阅读
    UILabel             *_labelReadCountLeft;
    UILabel             *_labelReadNameLeft;
    //关注
    UILabel             *_labelAttentionCountLeft;
    UILabel             *_labelAttentionNameLeft;
    
    UIImageView         *_imageViewfilmRight;
    UIImageView         *_imageViewHeadRight;
    UILabel             *_labelTitleRight;
    UILabel             *_labelContentRight;
    //阅读
    UILabel             *_labelReadCountRight;
    UILabel             *_labelReadNameRight;
    //关注
    UILabel             *_labelAttentionCountRight;
    UILabel             *_labelAttentionNameRight;
    
}
-(void) setItemText:(MyPublishModle*) systemMsgModle;


@end
