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
    
    _usefulData1 = @[@"good morning.",@"who is that?",@"what's the best thing to do?",@"Where are you going?",@"Where are you now?",@"Where are you from?",@"why?",@"What’s your plan　for today",@"What time are you going back home today?",@"What are you doing?",@"How is it going?",];
    
    _funnyArray = @[@"People who have a fulfilling life.",@"Oh no, not again.",@"lol",@"Are you serious?",@"Believe it to me",@"That doesn't matter.",@"You're kidding me!",@"You are genius.",@"Awesome.",@"Believe it to me.",@"I will cancel one's classes.",@"It's hopeless.",];
    
    _greeArray = @[@"Let's eat.",@"How was your day?",@"I'm leaving.",@"Thanks for the nice meal.",@"See you! have a good day.",@"I'm home.",@"You've gotta be tired.",@"It's delicious."];
    

    
    if(self.select_num == 1){
       
        _useArray = _usefulData1;
        
    }else if(self.select_num == 2){
        
        _useArray = _funnyArray;
    }else if (self.select_num == 3){
        _useArray = _greeArray;
    
    }
    
    
    
    
    _usefulTableView.delegate = self;
    self.usefulTableView.dataSource = self;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _useArray.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.select_num == 1) {
        return @"Useful";
    }else if (self.select_num == 2){
        return @"Slang";
    }else{
        return @"Greeting";
    }
}
//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _useArray[indexPath.row];
    
    return cell;
}
//何か行が押されたときdetailviewcontllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ExplanViewController *evc =[self.storyboard instantiateViewControllerWithIdentifier:@"ExplanViewController"];
    
    evc.select_num = indexPath.row;
    
    evc.select_button_num = self.select_num;
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:evc animated:YES];
    
    



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
