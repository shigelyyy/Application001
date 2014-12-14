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
    if (self.select_num == 1) {
            self.title = @"General Conversation";
    }else if (self.select_num == 2){
            self.title = @"Slang word";
    }else if(self.select_num == 3){
            self.title = @"Greeting";
    }
    
    
    _usefulData1 = @[@"who is that?",@"what's the best thing to do?",@"Where are you going?",@"Where are you now?",@"Where are you from?",@"why?",@"What’s your plan for today?",@"What time are you going back home today?",@"What are you doing?",@"How is it going?",@"What time is it?",@"How much is it?",];
    
    _funnyArray = @[@"People who have a fulfilling life.",@"Oh no, not again.",@"lol",@"Are you serious?",@"Leave it to me. ",@"That doesn't matter.",@"You're kidding me!",@"You are genius.",@"Awesome.",@"Leave it to me. ",@"I will cancel my classes.",@"It's hopeless.",@"It's delicious.",@"Oh, I see!",@"I blew it.",@"I only want love and warmth.",@"I know, right?",];
    
    _greeArray = @[@"good morning.",@"Let's eat.",@"Welcome back.",@"I'm leaving.",@"Thanks for the nice meal.",@"See you! have a good day.",@"I'm home.",@"You've gotta be tired.",];
    

    
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
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (self.select_num == 1) {
//        return @"Useful";
//    }else if (self.select_num == 2){
//        return @"Slang";
//    }else{
//        return @"Greeting";
//    }
//}
//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _useArray[indexPath.row];
    
    //Set backgroundView
    UIImageView *imageView;
    UIImage *image;
    image =[UIImage imageNamed:@"gray.png"];
    imageView = [[UIImageView alloc] initWithImage:image];
    
    cell.backgroundView = imageView;
    
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
