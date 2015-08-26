
#import <Foundation/Foundation.h>
//相关资料
@interface DramaRelativesModel : JSONModel

@property (nonatomic,strong) NSString<Optional>*  text; //文本
@property (nonatomic,strong) NSString<Optional>*  from; //来源
@property (nonatomic,strong) NSString<Optional>*  url; //连接

@end