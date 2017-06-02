//
//  ViewController.m
//  PopViewDemo
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}


- (void)showView{

    [PopView sharePopViewWithString:@"" resultBlock:^(NSString *result) {
        
        NSLog(@"result  = %@",result);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
