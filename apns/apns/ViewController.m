//
//  ViewController.m
//  apns
//
//  Created by shuisheng hong on 2022/4/24.
//

#import "ViewController.h"
#import "BottomEnumView.h"
#import "MathUtil.h"
#import "HelpViewController.h"

@interface ViewController (){
    BottomEnumView *_modDelDeviceAlert;
    NSString *_result;
    NSString *_httpBodyData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textBody.returnKeyType = UIReturnKeyDone;
    self.textTitle.returnKeyType = UIReturnKeyDone;
    self.bundleId.returnKeyType = UIReturnKeyDone;
    self.sound.returnKeyType = UIReturnKeyDone;
    self.deviceToken.returnKeyType = UIReturnKeyDone;
    self.badge.returnKeyType = UIReturnKeyDone;
    self.certPassword.returnKeyType=UIReturnKeyDone;
    self.certPassword.secureTextEntry=YES;
    self.certPassword.text=@"hong1234";
    self.textBody.text=@"This is a test content!";
    self.textTitle.text=@"Title";
    self.sound.text=@"ring.mp3";
   // self.bundleId.text=@"com.wecall.iot";
    
    self.textBody.delegate = self;
    self.textTitle.delegate = self;
    self.bundleId.delegate = self;
    self.sound.delegate = self;
    self.deviceToken.delegate = self;
    self.badge.delegate = self;
    self.certPassword.delegate=self;
    self.logTextView.editable=false;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleRecvMessageNotification:)
                                                 name:@"DEVICE_TOKEN"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleRemoteNotification:)
                                                 name:@"REMOTE_NOTIFICATION"
                                               object:nil];
    
}

- (void)handleRecvMessageNotification:(NSNotification *)notification {
    NSString *deviceToken= (NSString *)notification.object;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.deviceToken.text = deviceToken;
    });
}

- (void)handleRemoteNotification:(NSNotification *)notification {
    NSString *message= (NSString *)notification.object;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _result = [@"Receive remote notification:\r\n" stringByAppendingFormat:@"%@",message];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.logTextView.text = _result;
        });
    });
}



- (IBAction)alertTypeClick:(id)sender {
    NSLog(@"alertTypeClick");
    
    _modDelDeviceAlert = [[BottomEnumView alloc]initWithFrame:WholeScreen title:@"Select PayloadType" cancel:@"cancel" content:@[@"alert",@"background",@"voip",@"complication",@"fileprovider",@"mdm"] style:BottomAlertType];
    _modDelDeviceAlert.delegate = self;
    [self.view addSubview:_modDelDeviceAlert];
}

-(void)selBottomEnumIndex:(NSUInteger)index style:(BottomEnumStyle)style{
    if(style==BottomAlertType){
        NSArray *array=[NSArray arrayWithObjects:@"alert",@"background",@"voip",@"complication",@"fileprovider",@"mdm", nil];
        [_alertType setTitle:array[index] forState:UIControlStateNormal];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    if([string isEqualToString:@"\n"]){
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)sendClick:(id)sender {
    
    _result=@"";
    self.logTextView.text = _result;
    NSString *checksum = [MathUtil encodeDES:[NSString stringWithFormat:@"%@%@", self.bundleId.text,self.deviceToken.text] key:self.certPassword.text  nopadding:NO];

    NSDictionary *jsonDict = @{
                               @"appid":self.bundleId.text,
                               @"pushToken":self.deviceToken.text,
                               @"checksum":checksum,
                               @"type":self.alertType.titleLabel.text,
                               @"alertTitle":self.textTitle.text,
                               @"alertBody":self.textBody.text,
                               @"sound":self.sound.text,
                               @"badge":[NSNumber numberWithInt:[self.badge.text intValue]],
                               @"contentAvailable":[NSNumber numberWithInt:1],
                               @"fileds":@{@"type":@"ring",@"from":@"",@"to":@""},
                               };
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.we-call.cn:9000/apns_api/send"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:0];
    [request setValue:@"application/json"   forHTTPHeaderField:@"Content-Type"];

    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error !=nil){
            _result = [_result stringByAppendingFormat:@"%@",@"Send http data fail\r\n"];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.logTextView.text = _result;
            });
        }else{
            NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
            _result = [_result stringByAppendingFormat:@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.logTextView.text = _result;
            });
        }
    }];

    [task resume];

}

- (IBAction)helpClick:(id)sender {
    HelpViewController *VC = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    [self presentViewController:VC
                                 animated:NO
                               completion:nil];
}

@end
