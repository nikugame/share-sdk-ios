//
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum NikuShareChannel{
    SHARECHANNEL_WEIXIN = 0,
    SHARECHANNEL_QQ     =1,
    SHARECHANNEL_WEIBO = 2
};

enum NikuShareType{
    SHARETYPE_TEXT = 0,
    SHARETYPE_IMAGE = 1,
    SHARETYPE_NEWS = 2
};

#define kLoginFailed    @"loginFailed"
#define kLoginCancelled @"loginCancelled"
@interface NikuShareData : NSObject

@property (nonatomic, retain) NSString  *shareText;
@property (nonatomic, retain) NSData   *thumbImg;
@property (nonatomic, retain) NSData    *imgData;
@property (nonatomic, retain) NSString  *previewUrl;
@property (nonatomic, retain) NSString  *webpageUrl;
@property (nonatomic, retain) NSString  *title;
@property (nonatomic, retain) NSString  *shareDescription;

@property (nonatomic, retain) NSString  *objectId;
@property (nonatomic, retain) NSString  *redirectURI;
@property (nonatomic, retain) NSString  *scop;
@property (nonatomic, strong) NSDictionary  *userInfo;


@property (nonatomic, assign) int iShareChannel;

@property (nonatomic,assign) int iShareType;

@property (nonatomic,assign) int iShareposition;

-(void)clearData;


@end
