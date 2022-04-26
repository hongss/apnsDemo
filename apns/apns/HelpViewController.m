//
//  HelpViewController.m
//  apns
//
//  Created by shuisheng hong on 2022/4/26.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.helpWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/hongss/apnsDemo"]]];
}
- (IBAction)closeClick:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{

    }];
}
- (IBAction)clickCode:(id)sender {
    [self.helpWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/hongss/apnsDemo"]]];
}

- (IBAction)clickServer:(id)sender {
    [self.helpWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.we-call.cn:9000"]]];
}

- (IBAction)helpClick:(id)sender {
    [self.helpWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.we-call.cn:9000/help"]]];
}

@end
