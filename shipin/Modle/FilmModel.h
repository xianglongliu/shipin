//
//  FilmModel
//  movikr
//
//  Created by dust on 15/6/18.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

@interface FilmModel : JSONModel

@property (nonatomic,strong) NSString<Optional>*    filmTitle;      
@property (nonatomic,strong) NSString<Optional>*    filmContent;
@property (nonatomic,strong) NSURL<Optional>*       fileUrl;

@end
