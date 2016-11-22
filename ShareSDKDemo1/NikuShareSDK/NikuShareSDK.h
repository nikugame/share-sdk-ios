//
//  NikuShareSDK.h
//  NikuShareSDK
//
//  Created by Sail on 11/18/16.
//  Copyright © 2016 nikugame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/TencentApiInterface.h>

#import "WeiboSDK.h"
#import "NikuShareData.h"

#define kCGIRequest @"kTencentCGIRequest"
#define kResponse @"kResponse"
#define kTencentOAuth @"oauth"
#define kUIViewController @"UIViewController"
#define kTencentRespObj @"kTencentRespObj"

//delagate

//login
#define kLoginSuccessed @"loginSuccessed"
#define kLoginFailed    @"loginFailed"
#define kLoginCancelled @"loginCancelled"

//qzone
#define kGetUserInfoResponse @"getUserInfoResponse"
#define kAddShareResponse @"addShareResponse"
#define kUploadPicResponse @"uploadPicResponse"
#define kGetListAlbumResponse @"getListResponse"
#define kGetListPhotoResponse @"getListPhotoResponse"
#define kAddTopicResponse @"addTopicResponse"
#define kChangePageFansResponse @"changePageFansResponse"
#define kAddAlbumResponse @"kAddAlbumResponse"
#define kAddOneBlogResponse @"kAddOneBlogResponse"
#define kSetUserHeadPicResponse @"kSetUserHeadPicResponse"
#define kGetVipInfoResponse @"kGetVipInfoResponse"
#define kGetVipRichInfoResponse @"kGetVipRichInfoResponse"
#define kSendStoryResponse @"kSendStoryResponse"
#define kCheckPageFansResponse @"kCheckPageFansResponse"

//TCAPIRequest
#define kTencentCGIRequest     @"kTencentCGIRequest"


//tencentApi
#define kTencentApiResp @"kTencentApiResp"


//????
#define kCloseWnd @"kCloseWnd"
@interface NikuShareSDK : NSObject<TencentSessionDelegate,WeiboSDKDelegate>
{
    NikuShareData  *nikuShareData;
}

+ (NikuShareSDK *)instance;


-(void)registWeixinAppId:(NSString* )appId withGameName:(NSString*)gameName;
-(void)registQQAppId:(NSString* )appId;
-(void)registWeboAppId:(NSString* )appId;

-(NikuShareData*)getNikuShareData;

-(void)nkShare:(int)shareType withChannel:(int)shareChannle;
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request;
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response;
@end
