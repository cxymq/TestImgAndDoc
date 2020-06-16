//
//  ViewController.h
//  Test
//
//  Created by nazimai on 2020/6/4.
//  Copyright © 2020 nazimai. All rights reserved.
//

/*!

@header ViewController.h

@abstract 图片测试

@author Created by Pan on 2020/6/4.

@version 1.2.0 2020/6/4 Creation

*/

#import <UIKit/UIKit.h>
/*!

@class ViewController

@abstract 图片测试测试。

*/
@interface ViewController : UIViewController

/*!

@property assertImgView

@abstract 用于显示图片

*/
@property (weak, nonatomic) IBOutlet UIImageView *assertImgView;
@property (weak, nonatomic) IBOutlet UIImageView *bundleImgView;
@property (weak, nonatomic) IBOutlet UIImageView *rootImgView;
@property (weak, nonatomic) IBOutlet UIImageView *gifImgView;

/*!

@abstract 测试方法

@discussion 测试 appledoc 方法

@param line 行数

@result NSString

*/
- (NSString *)testWithLine:(NSString *)line;

@end

