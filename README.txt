1.导入libNikuShareSDK.a ,NikuShareSDK.h
2.导入libWeChatSDK.a,WXApi.h,WechatAuthSDK.h,WXApiObject.h
3.导入TencentOpenAPI.framework,TencentOpenApi_IOS_Bundle.bundle
4.导入libWeiboSDK.a,WeiboSDK.bundle,及微博头文件
5.导入SystemConfiguration.framework,libz.tbd,Foundation.framework,libstdc++.6.0.9.tbd,
Security.framework,libiconv.tbd,CoreGraphics.framework,QuartzCore.framework,ImageIO.framework,CoreTelephony.framework,CoreText.framework,UIKit.framework,libsqlite3.0.tbd,

6.build settings —> other linker flag 增加 fobjc-arc -ObjC

7.info.plist中加入以下配置信息：(不要和已有配置重复)，然后在对应的URL Schemes中修改对应的appid.(Info -> URL Types )
<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>weibosdk2.5</string>
		<string>weibosdk</string>
		<string>sinaweibohd</string>
		<string>sinaweibo</string>
		<string>weixin</string>
		<string>mqq</string>
		<string>mqqapi</string>
		<string>mqqwpa</string>
		<string>mqqbrowser</string>
		<string>mttbrowser</string>
		<string>mqqOpensdkSSoLogin</string>
		<string>mqqopensdkapiV2</string>
		<string>mqqopensdkapiV3</string>
		<string>mqqopensdkapiV4</string>
		<string>wtloginmqq2</string>
		<string>mqzone</string>
		<string>mqzoneopensdk</string>
		<string>mqzoneopensdkapi</string>
		<string>mqzoneopensdkapi19</string>
		<string>mqzoneopensdkapiV2</string>
		<string>mqqapiwallet</string>
		<string>mqqopensdkfriend</string>
		<string>mqqopensdkdataline</string>
		<string>mqqgamebindinggroup</string>
		<string>mqqopensdkgrouptribeshare</string>
		<string>tencentapi.qq.reqContent</string>
		<string>tencentapi.qzone.reqContent</string>
	</array>
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>weixin</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>wx67b6059559daff51</string>
			</array>
		</dict>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>tencent</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>tencent222222</string>
			</array>
		</dict>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>com.weibo</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>3001014611</string>
			</array>
		</dict>
	</array>
8.调用注册接口，如果使用过相关第三方注册接口可以省略（如微信登录等）
微信：    [[NikuShareSDK instance ]registWeixinAppId:@"wx67b6059559daff51" withGameName:@"暗黑信仰"];
QQ：      [[NikuShareSDK instance] registQQAppId:@"222222"];
微博：	  [[NikuShareSDK instance]registWeboAppId:@"3001014611"];
以上具体设置和使用可以参考DEMO
9.清理数据： [[[NikuShareSDK instance]getNikuShareData]clearData];
10.设置分享参数，分享


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


11.二维码生成功能，导入QrCodeImage.h
   /**
 *  生成带logo的二维码
 *  二维码和logo都是正方形的
 *  @param urlString     二维码中的链接
 *  @param QRCodeCGRect  二维码的CGRect
 *  @param logoImage     二维码中的logo
 *  @param logoImageSize logo的大小
 *  @param cornerRadius  logo的圆角值大小
 *
 *  @return 生成的二维码
 */
+ (QrCodeImage *)creatQRCodeWithURLString:(NSString *)urlString superView:(UIView *)superView logoImage:(UIImage *)logoImage logoImageSize:(CGSize)logoImageSize logoImageWithCornerRadius:(CGFloat)cornerRadius;






