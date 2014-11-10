//
//  ExplanViewController.m
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "ExplanViewController.h"

@interface ExplanViewController ()

@end

@implementation ExplanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _usefulData1 = @[@"good morning.",@"How is it going?",@"What is the mateter?",@"How have you been?",];
    _usefulDate2 = @[@"what are you up to?",@"what's on for today?",@"how much is it?",@"when will class last?",];
    self.myExplanLabel.text = _usefulData1[self.select_num];
     self.myExplanLabel.text = [NSString stringWithFormat:@"%@とは",_usefulData1[self.select_num]];
   //次ぎやるとこ
    //とはをsection2もまとめてやる

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

@end
