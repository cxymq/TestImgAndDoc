//
//  ViewController.m
//  Test
//
//  Created by nazimai on 2020/6/4.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "ViewController.h"
#import "NZMViewController.h"

@interface ViewController ()


@end

@implementation ViewController
/**
 viewDidLoad 方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.lightGrayColor;

    // 测试显示图片
    [self showImage];

    // 测试字符截取
    [self labelLimitlength];

    // 测试 CATransaction
    [self transactionAnimation];
}

- (void)transactionAnimation {
    CALayer *transcationLayer = [[CALayer alloc] init];
    transcationLayer.backgroundColor = UIColor.systemPinkColor.CGColor;
    transcationLayer.frame = CGRectMake(200, 100, 200, 200);
    [self.view.layer addSublayer:transcationLayer];

    // Outer transaction animates `opacity` to 0 over 2 seconds
    [CATransaction begin];
    [CATransaction setValue:@(NO) forKey:kCATransactionDisableActions];
    [CATransaction setAnimationDuration:2.f];
    [CATransaction setCompletionBlock:^{
//        [transcationLayer removeFromSuperlayer];
        transcationLayer.frame = CGRectMake(100, 400, 200, 200);
    }];

    transcationLayer.opacity = 0.2;

    // Inner transaction animates scale to (3, 3, 3) over 1 second
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.f];

    transcationLayer.transform = CATransform3DMakeScale(3, 3, 3);
    // Commits inner transaction
    [CATransaction commit];
    // Commits outer transaction
    [CATransaction commit];
}

- (void)showImage {
    self.assertImgView.image = [UIImage imageNamed:@"cc_icon_emoji"];
        // 不显示
    //    self.bundleImgView.image = [UIImage imageNamed:@"gaoxiao"];
        // 方法一
    //    self.bundleImgView.image = [UIImage imageNamed:@"imgs.bundle/gaoxiao"];
    //     方法二
    //    self.bundleImgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imgs.bundle/gaoxiao" ofType:@"png"]];
        // 方法三
        NSString *imgsPath = [[NSBundle mainBundle] pathForResource:@"imgs" ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:imgsPath];
        self.bundleImgView.image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"gaoxiao" ofType:@"png"]];
        // 方法一
    //    self.rootImgView.image = [UIImage imageNamed:@"vip"];
        // 方法二
    //    self.rootImgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vip" ofType:@"png"]];
        // 方法三
        self.rootImgView.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vip" ofType:@"png"]]];
}

- (void)labelLimitlength {
    NSString *str = @"123456789";
    NSLog(@"str -> %@", [str substringToIndex:5]);
    NSString *str2 = @" 12 34 56789";
    NSLog(@"str2 -> %@", [str2 substringToIndex:5]);
    NSString *str3 = @"这1 d!3456789";
    NSLog(@"str3 -> %@", [self asciiLengthOfString:str3]);
    NSLog(@"str3 -> %@", [str3 substringToIndex:5]);
    NSString *str4 = @"     123456789";
    NSLog(@"str4 -> %@", [str4 substringToIndex:5]);
    NSString *str5 = @"@1.~的)&23456789";
    NSLog(@"str5 -> %@", [str5 substringToIndex:5]);
    NSLog(@"str5 -> %@", [self asciiLengthOfString:str5]);
}

- (NSString *)asciiLengthOfString:(NSString *)str {
    NSMutableString *newStr = [NSMutableString string];
    NSUInteger ascriiLength = 0;
    for (int i = 0; i < str.length; i++) {
        unichar uc = [str characterAtIndex:i];
        ascriiLength += isascii(uc) ? 1 : 2;
        if (ascriiLength < 5) {
            [newStr appendString:[NSString stringWithCharacters:&uc length:1]];
        } else {
            return newStr;
        }
    }
    return newStr;
}

- (NSString *)testWithLine:(NSString *)line {
    return line;
}

- (IBAction)nextVC:(id)sender {
    [self.navigationController pushViewController:[NZMViewController new] animated:YES];
}

@end
