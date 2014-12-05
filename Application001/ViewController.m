//
//  ViewController.m
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "ViewController.h"
#import "ExplanViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Useful";
    
    _usefulData1 = @[@"good morning.",@"How is it going?",@"What is the mateter?",@"How have you been?",@"what are you up to?",@"what's on for today?",@"how much is it?",@"when will class last?",];
//    _usefulDate2 = @[@"what are you up to?",@"what's on for today?",@"how much is it?",@"when will class last?",];
    _usefulTableView.delegate = self;
    self.usefulTableView.dataSource = self;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //if (section == 0) {
        return _usefulData1.count;
//    }else{
//        return _usefulDate2.count;
//    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
        return @"Greeting";
//    }else{
//    return @"5W1H";
//    }
}
//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [_usefulData1 objectAtIndex:indexPath.row];
    }
//    else{
//        cell.textLabel.text = [_usefulDate2 objectAtIndex:indexPath.row];
//    
//    }
    return cell;
}
//何か行が押されたときdetailviewcontllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ExplanViewController *evc =[self.storyboard instantiateViewControllerWithIdentifier:@"ExplanViewController"];
    evc.select_num = indexPath.row;
    evc.section_num = indexPath.section;
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:evc animated:YES];
    
    



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
