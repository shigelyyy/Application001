//
//  MenuViewController.m
//  Application001
//
//  Created by user on 2014/11/09.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)UsefulAction:(id)sender {
    //遷移先画面のカプセル化（インスタンスカ）storybord上でDetailViewControlleの
    ViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    //ナビゲーションコントローラーの機能で画面遷移（別の画面に移動する事）
    [[self navigationController] pushViewController:vc animated:YES];



}
@end
