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

- (NSString *)testWithLine:(NSString *)line {
    return line;
}


@end
