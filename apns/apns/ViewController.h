//
//  ViewController.h
//  apns
//
//  Created by shuisheng hong on 2022/4/24.
//

#import <UIKit/UIKit.h>
#import "BottomEnumView.h"

@interface ViewController : UIViewController<BottomEnumViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *alertType;

@property (weak, nonatomic) IBOutlet UITextField *bundleId;
@property (weak, nonatomic) IBOutlet UITextField *deviceToken;
@property (weak, nonatomic) IBOutlet UITextField *sound;
@property (weak, nonatomic) IBOutlet UITextField *badge;
@property (weak, nonatomic) IBOutlet UITextField *textBody;

@property (weak, nonatomic) IBOutlet UITextField *textTitle;

@property (weak, nonatomic) IBOutlet UITextField *certPassword;

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@property (weak, nonatomic) IBOutlet UIButton *helpBtn;

@end

