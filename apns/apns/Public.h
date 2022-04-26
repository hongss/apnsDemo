//
//  Public.h
//  jeevesApp
//
//  Created by tpv tpv on 17/8/25.
//  Copyright © 2017年 TPVision India Pvt Ltd. All rights reserved.
//

#ifndef Public_h
#define Public_h


#define UIAppDelegate  ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define TopWindow [UIApplication sharedApplication].keyWindow
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define WEAKSELF_AT __weak __typeof(&*self)weakSelf_AT = self;



#define CentraleSansBook @"CentraleSansBook"
#define CentraleSansMedium @"CentraleSansMedium"
#define CentraleSansLight @"CentraleSansLight"
#define CentraleSansBold @"CentraleSansBold"
#define CentraleSansThin @"CentraleSansThin"
#define Roboto_Light @"Roboto-Light"
#define Roboto_Medium @"Roboto-Medium"
#define Roboto_Bold @"Roboto-Bold"
#define Roboto_Regular @"Roboto-Regular"
#define Roboto_Black @"Roboto-Black"
#define Roboto_Thin @"Roboto-Thin"
#define Roboto_Light @"Roboto-Light"
#define Roboto_Italic @"Roboto-Italic"

#define BUTTON_CORNER 20


//About User Defaults Key
#define KUserAccountNum  @"AccountNum"
#define KUserAccountPassword  @"AccountPassword"
#define KResetPasswordTimeKey  @"ResetPasswordTimeKey"
#define KUserStoreWifiName @"StoreWifiName"
#define KUserStoreWifiPW @"StoreWifiPW"
#define KUserStoreCameraName @"StoreCameraName"
#define KUserStoreCameraPW @"StoreCameraPW"
#define KUserStoreCameraUrls @"StoreCameraUrls"
#define KUserStoreCurCameraUrl @"StoreCurCameraUrl"
#define KHomeIndex @"KHomeIndex"

//About NotificationChange
#define KNotiTCPServerConnect @"KNotiTCPServerConnect"
#define KNotiLoginSuccess @"KNotiLoginSuccess"
#define KNotiAppBecomeActive @"AppBecomeActive"

#define KNotiChooseContryCode @"KNotiChooseContryCode"
#define KNotiCreateAccountLogin @"KNotiCreateAccountLogin"

#define KNotiModActionModel @"ModActionModel"
#define KNotiModTimeConditionMoel @"ModTimeConditionMoel"
#define KNotiWifiSSIDChange @"WifiSSIDChange"
#define KNotiHomeRequestFailed @"HomeRequestFailed"
#define KNotiCreateHomeSuccessful @"CreateHomeSuccessful"
#define KNotiCreateHomeFailed @"CreateHomeFailed"
#define KNotiUpdateDeviceStatus @"UpdateDeviceStatus"
#define KNotiRefreshSceneData @"RefreshSceneData"
#define KNotiRefreshHomeData @"RefreshHomeData"
#define KnotiBackSceneViewScreen @"BackSceneViewScreen"
#define BackAddRoomView @"BackAddRoomView"
#define KNotiQRSearchDevice @"QRSearchDevice"
#define KNotiReRequestDeviceData @"ReRequestDeviceData"

#define KNSLocalizedString(key)    NSLocalizedString(key, nil)

#define GetColorWithRGBValues(R,G,B,A)	([UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A])
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define BGColor                             RGBA(245,245,245,1)

#define KClearColor                       [UIColor clearColor]
#define KWhiteColor                       RGB(255,255,255)
#define KBlackColor                       RGB(0,0,0)
#define KRedColor                         RGB(255,0,0)
#define KGrayColor                        RGB(143, 144, 144)
#define KWholeBgAlpha                     0.2



#define KBaseNAVICOLOR                    RGB(26, 54, 112)
#define KMainColor                        RGBA(80,41,227,1)
#define KLightMainColor                   RGBA(80,41,227,0.35)
#define KEditBorderColor                  RGBA(20,116,164,1)
#define KNormalBorderColor                RGBA(196,196,196,1)
#define KErrorColor                       RGBA(230,88,0,1)
#define KErrorBorderColor                 RGBA(230,88,0,1)
#define KErrorBGColor                     RGBA(255,241,211,1)
#define KErrorTextColor                   RGBA(230, 88, 0, 1)
#define KDarkBtnTitleColor                RGBA(28,45,102,1)
#define KSceneNameBGColor                 RGBA(10,12,30,1)
#define KTextColor                        RGBA(10,12,30,1)


#ifndef UIColorHex
#define UIColorHex(_hex_)   [UtilToolMethod colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

//About Size
#define NAVIGATIONHIGHT (self.navigationController.navigationBar.frame.size.height)
#define STATUSHIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define TABBARHIGHT (self.tabBarController.tabBar.frame.size.height)
#define kSafeBottomHeight (kIsIhoneXSeries ? 34 : 0)
// 如果是iPhone X系列，底部safe弯曲的横条与底部的距离
#define kSafeBottomLineGap (kIsIhoneXSeries ? 15 : 0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define MAINSIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width/375)
#define MAINSIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height/667)
#define ScaleWidth ([[UIScreen mainScreen] bounds].size.width/375)
#define ScaleHeight ([[UIScreen mainScreen] bounds].size.height/667)
#define WholeScreen CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
#define TOPNAVI  NAVIGATIONHIGHT+ STATUSHIGHT
#define DOWNVIEW  SCREEN_HEIGHT - NAVIGATIONHIGHT - TABBARHIGHT

#define DefaultCGRect CGRectMake(0, 0, 0, 0)
#define KCellRowHeight 53
#define KDeviceCellHeight 110
#define KBottomHeight 58*([[UIScreen mainScreen] bounds].size.height/667)

#define MW  ([[UIScreen mainScreen] bounds].size.width/375)
#define MH  ([[UIScreen mainScreen] bounds].size.height/667)
#define FOX  frame.origin.x
#define FOY  frame.origin.y
#define FSW  frame.size.width
#define FSH  frame.size.height


//About Version
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define Version(float) ([[UIDevice currentDevice].systemVersion doubleValue] >= float)
#define IS_IOS10ORLATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10)

//About MacDevice
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//iPhone4S
#define IS_iPhone_4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// iPhone5 iPhone5s iPhoneSE
#define IS_iPhone_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// iPhone6 7 8
#define IS_iPhone_6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
// iPhone6plus  iPhone7plus iPhone8plus
#define IS_iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

// 是否是有刘海的机型
#define kIsIhoneXSeries ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].statusBarFrame.size.height > 20) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})

// iPhoneX
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_iPhoneXSM ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


//LocalizeString
#define _(key, val) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:(val) table:(nil)]

#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"[FileName:%s]" " [Function:%s]" " --[Line:%d]" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

//通用无参block，用于保存一段代码
typedef void(^NoParamBlock)(void);


#endif /* Public_h */
