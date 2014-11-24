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
    
//    self.myExplanLabel.text = _usefulData1[self.select_num];
//     self.myExplanLabel.text = [NSString stringWithFormat:@"%@とは",_usefulData1[self.select_num]];
    //ユーザーデフォルトからデータを取り出す箱を取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *useful1;
    NSArray *useful2;
    //保存されたデータを取り出す
    useful1 = [defaults objectForKey:@"usefulTable1"];
    useful2 = [defaults objectForKey:@"usefulTable2"];
    //nilは何もないという状態
    if (useful1 == nil) {
        useful1 = @[@{@"name":@"good morning.",@"desc":@"ohayo",@"favoriteflag":@"0"},
                    @{@"name":@"How is it going?",@"desc":@"gennki?",@"favoriteflag":@"0"},
                    @{@"name":@"What is the mateter?",@"desc":@"dousita?",@"favoriteflag":@"0"},
                    @{@"name":@"How have you been?",@"desc":@"gennkidatta?",@"favoriteflag":@"0"},];
    }
    if (useful2 == nil) {
        useful2 = @[@{@"name":@"what are you up to?",@"desc":@"nanisiteruno?",@"favoriteflag":@"0"},
                    @{@"name":@"what's on for today?",@"desc":@"kyounoyoteiha?",@"favoriteflag":@"0"},
                    @{@"name":@"how much is it?",@"desc":@"koreikura?",@"favoriteflag":@"0"},
                    @{@"name":@"when will class last?",@"desc":@"kyouzyugyouituowaru?",@"favoriteflag":@"0"},];

    }
    _usefulData1 = useful1.mutableCopy;
    _usefulDate2 = useful2.mutableCopy;
    
    id favoriteflag;
    if (self.section_num == 0) {
        //タイトルにとはとつける
        self.myExplanLabel.text = [NSString stringWithFormat:@"About→%@",_usefulData1[self.select_num][@"name"]];
        //説明を表示する
        self.descriptionText.text = _usefulData1[self.select_num][@"desc"];
        //favoriteflagを取り出す
        favoriteflag = _usefulData1[self.select_num][@"favoriteflag"];
    }else{
        self.myExplanLabel.text = [NSString stringWithFormat:@"About→%@",_usefulDate2[self.select_num][@"name"]];
        
        self.descriptionText.text = _usefulDate2[self.select_num][@"desc"];
        
        favoriteflag = _usefulDate2[self.select_num][@"favoriteflag"];
        
    }
    
    //intvalueでfavoriteflagを整数型にする
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        //ボタンの表示
        [self.favoriteBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
    }else{
        [self.favoriteBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
    }
    
    
    
   
   

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

- (IBAction)addFavoriteList:(id)sender {
    //まずは変更可能なdictinaly型を作るselectteduseful
    NSDictionary *selectteduseful;
    id favoriteflag;
    NSMutableDictionary *changedUseful;
    if (self.section_num == 0) {
        //まずはこれ
        selectteduseful = _usefulData1[self.select_num];
        //次に変更可能なNSMutableDictionaly型を作る上のselecttedusefulを代入
        changedUseful = selectteduseful.mutableCopy;
        //favoriteflagをid型で取り出す
        favoriteflag = _usefulData1[self.select_num][@"favoriteflag"];
    }else{
        
        selectteduseful = _usefulDate2[self.select_num];
        
        changedUseful = selectteduseful.mutableCopy;
       
        favoriteflag = _usefulDate2[self.select_num][@"favoriteflag"];

    
    }
    //int型に代入
    int intFavFlag = [favoriteflag integerValue];
    
    if (intFavFlag == 0) {
        [changedUseful setObject:@1 forKey:@"favoriteflag"];
        //これからお気に入りに追加されるため、ボタン名を解除にセットにしておく
        [self.favoriteBtn setTitle:@"お気に入りを解除" forState:UIControlStateNormal];
    }else{
        [changedUseful setObject:@0 forKey:@"favoriteflag"];
        //ボタンを追加にセットしておく
        [self.favoriteBtn setTitle:@"お気に入りに追加" forState:UIControlStateNormal];
    }
    //userdefaultを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //文字を保存
    if (self.section_num == 0) {
        //順番間違えちゃあかん
        [_usefulData1 replaceObjectAtIndex:self.select_num withObject:changedUseful];
        //_usefulData1をusefulTable1に保存
        [defaults setObject:_usefulData1 forKey:@"usefulTable1"];
    }else{
        [_usefulDate2 replaceObjectAtIndex:self.select_num withObject:changedUseful];
        
        [defaults setObject:_usefulDate2 forKey:@"usefulTable2"];
    }
    [defaults synchronize];//userdefaultにきちんと保存される
    
}
@end
