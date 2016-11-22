
#import "ViewController.h"
#import "NikuShareSDK.h"
#import "WXApi.h"
//#import "NikuShareData.h"
@interface ViewController ()

@end

@implementation ViewController

//NSString* wbtoken;
//NSString* wbCurrentUserID;
//NSString* wbRefreshToken;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(95, 20, 200, 27);
    [button setTitle:@"微信文字分享" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(wechatShar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(95, 60, 200, 27);
    [button1 setTitle:@"微信纯图分享" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(wechatImageShar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(95, 100, 200, 27);
    [button2 setTitle:@"微信新闻分享" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(wechatNewsShar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(95, 160, 200, 27);
    [button3 setTitle:@"QQ文字分享" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(tencentShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(95, 200, 200, 27);
    [button4 setTitle:@"QQ纯图分享" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(tencentImgShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = CGRectMake(95, 240, 200, 27);
    [button5 setTitle:@"QQ新闻分享" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(tencentNewsShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button6.frame = CGRectMake(95, 300, 200, 27);
    [button6 setTitle:@"微博文字分享" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(weiboTextShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button7.frame = CGRectMake(95, 340, 200, 27);
    [button7 setTitle:@"微博纯图分享" forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(weiboImgShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button8.frame = CGRectMake(95, 380, 200, 27);
    [button8 setTitle:@"微博新闻分享" forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(weiboNewsShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    
    
    
    [[NikuShareSDK instance ]registWeixinAppId:@"wx67b6059559daff51" withGameName:@"暗黑信仰"];
    [[NikuShareSDK instance] registQQAppId:@"222222"];
    // [[NikuShareSDK instance] registWeboAppId:@"wb2045436852"];
    [[NikuShareSDK instance]registWeboAppId:@"3001014611"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)weiboTextShare:(id)weiboTextShare {
    NSLog(@"微博文本分享");
    [[[NikuShareSDK instance]getNikuShareData]clearData];
    //微博分享回调地址
    [[[NikuShareSDK instance]getNikuShareData]setRedirectURI:@"http://www.sina.com"];
    [[[NikuShareSDK instance]getNikuShareData]setScop:@"all"];
    [[[NikuShareSDK instance] getNikuShareData] setShareText:@"微博文本分享"];
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_TEXT withChannel:SHARECHANNEL_WEIBO];
}



- (void)weiboImgShare:(id)weiboImgShare {
    [[[NikuShareSDK instance]getNikuShareData]clearData];
    NSLog(@"微博纯图分享");
    //微博分享回调地址
    [[[NikuShareSDK instance]getNikuShareData]setRedirectURI:@"http://www.sina.com"];
    [[[NikuShareSDK instance]getNikuShareData]setScop:@"all"];
    
    //设置图片内容
    NSString* filePath=[[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    [[[NikuShareSDK instance] getNikuShareData] setImgData:[NSData dataWithContentsOfFile:filePath]];
    
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"微博纯图分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"内容描述"];
    
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_IMAGE withChannel:SHARECHANNEL_WEIBO];
}


- (void)weiboNewsShare:(id)weiboNewsShare {
    NSLog(@"微博新闻分享");
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    
    //微博分享回调地址
    [[[NikuShareSDK instance]getNikuShareData]setRedirectURI:@"http://www.sina.com"];
    [[[NikuShareSDK instance]getNikuShareData]setScop:@"all"];
    
    
    //微博分享ID
    [[[NikuShareSDK instance]getNikuShareData]setObjectId:@"identifier1"];
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"微博新闻分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"内容描述"];
    
    //设置预览图
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"];
    [[[NikuShareSDK instance] getNikuShareData] setThumbImg:[NSData dataWithContentsOfFile:filePath]];
    
    
    //设置链接地址
    [[[NikuShareSDK instance] getNikuShareData] setWebpageUrl:@"http://sina.cn?a=1"];
    
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_NEWS withChannel:SHARECHANNEL_WEIBO];
}


- (void)tencentShare:(id)tencentsShare {
    NSLog(@"QQ文本分享");
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    [[[NikuShareSDK instance] getNikuShareData] setShareText:@"QQ文本分享"];
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_TEXT withChannel:SHARECHANNEL_QQ];
}

- (void)tencentImgShare:(id)tencentImgShare {
    NSLog(@"QQ纯图分享");
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    //设置预览图
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
    [[[NikuShareSDK instance] getNikuShareData] setThumbImg:[NSData dataWithContentsOfFile:filePath]];
    //设置图片内容
    filePath=[[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    [[[NikuShareSDK instance] getNikuShareData] setImgData:[NSData dataWithContentsOfFile:filePath]];
    
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"QQ纯图分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"内容描述"];
    
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_IMAGE withChannel:SHARECHANNEL_QQ];
}

- (void)tencentNewsShare:(id)tencentNewsShare {
    NSLog(@"QQ新闻分享");
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    
    [[[NikuShareSDK instance] getNikuShareData] setPreviewUrl:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"];
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"QQ纯图分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"QQ内容描述"];
    
    //设置链接地址
    [[[NikuShareSDK instance] getNikuShareData] setWebpageUrl:@"http://www.baidu.com"];
    
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_NEWS withChannel:SHARECHANNEL_QQ];
    
    
    
}



- (void)wechatShar:(id)wechatShar {
    NSLog(@"微信文字分享");
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    [[[NikuShareSDK instance] getNikuShareData] setShareText:@"微信文本分享"];
    //分享位置
    [[[NikuShareSDK instance] getNikuShareData] setIShareposition:WXSceneSession];
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_TEXT withChannel:SHARECHANNEL_WEIXIN];
    
}
//微信纯图分享
- (void)wechatImageShar:(id)wechatImageShar{
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    //设置预览图
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
    [[[NikuShareSDK instance] getNikuShareData] setThumbImg:[NSData dataWithContentsOfFile:filePath]];
    //设置图片内容
    filePath=[[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    [[[NikuShareSDK instance] getNikuShareData] setImgData:[NSData dataWithContentsOfFile:filePath]];
    
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"微信纯图分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"内容描述"];
    
    //分享位置
    [[[NikuShareSDK instance] getNikuShareData] setIShareposition:WXSceneSession];
    
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_IMAGE withChannel:SHARECHANNEL_WEIXIN];
}

//微信新闻分享
- (void)wechatNewsShar:(id)wechatNewsShar{
     [[[NikuShareSDK instance]getNikuShareData]clearData];
    //设置预览图
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
    [[[NikuShareSDK instance] getNikuShareData] setThumbImg:[NSData dataWithContentsOfFile:filePath]];
    
    //设置链接地址
    [[[NikuShareSDK instance] getNikuShareData] setWebpageUrl:@"https://open.weixin.qq.com"];
    
    //标题
    [[[NikuShareSDK instance] getNikuShareData] setTitle:@"微信纯图分享"];
    //描述
    [[[NikuShareSDK instance] getNikuShareData] setShareDescription:@"内容描述"];
    //分享位置
    [[[NikuShareSDK instance] getNikuShareData] setIShareposition:WXSceneSession];
    //分享
    [[NikuShareSDK instance] nkShare:SHARETYPE_NEWS withChannel:SHARECHANNEL_WEIXIN];
}






@end
