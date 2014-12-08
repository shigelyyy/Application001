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
    NSError *error = nil;
    
    //ユーザーデフォルトからデータを取り出す箱を取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *useful1;
//    NSArray *useful2;
    useful1 = [defaults objectForKey:@"usefulTable1"];
//    useful2 = [defaults objectForKey:@"usefulTable2"];
    //nilは何もないという状態
//        if (useful1 == nil) {
            useful1 = @[@{@"name":@"good morning.",@"desc":@"the pronunciation of a Jpanese\n ohayo",@"favoriteflag":@"0",@"sounddate":@""},
                    
                    @{@"name":@"who is that?",@"desc":@"the pronunciation of a Jpanese\n ano-hito-dare?",@"favoriteflag":@"0",@"sounddate":@"あの人誰？"},
                    
                    @{@"name":@"what's the best thing to do?",@"desc":@"the pronunciation of a Jpanese\n dousitara-ii-no?",@"favoriteflag":@"0",@"sounddate":@"どうしたらいいの"},
                    
                    @{@"name":@"Where are you going?",@"desc":@"the pronunciation of a Jpanese\n doko-iku-no?",@"favoriteflag":@"0",@"sounddate":@"どこいくの？"},
                    
                    @{@"name":@"Where are you now?",@"desc":@"the pronunciation of a Jpanese\n　doko-iru-no? ",@"favoriteflag":@"0",@"sounddate":@"どこいんの？"},
                    
                    @{@"name":@" Where are you from? ",@"desc":@"the pronunciation of a Jpanese\n doko-syussinn-desu-ka",@"favoriteflag":@"0",@"sounddate":@"どこ出身ですか？"},
                    
                    @{@"name":@"why?",@"desc":@"the pronunciation of a Jpanese\n nann-de ",@"favoriteflag":@"0",@"sounddate":@"なんで？"},
                    
                    @{@"name":@"What’s your plan　for today？",@"desc":@"the pronunciation of a Jpanese\n kyou-yotei-aru?",@"favoriteflag":@"0",@"sounddate":@"今日予定ある？"},
                    
                    @{@"name":@"What time are you going back home today?",@"desc":@"the pronunciation of a Jpanese\n kyou-nannzi-ni-kaeru?",@"favoriteflag":@"0",@"sounddate":@"今日何時に帰る？"},
                    
                    @{@"name":@"What are you doing?",@"desc":@"the pronunciation of a Jpanese\n nani-siteru-no?",@"favoriteflag":@"0",@"sounddate":@"何してんの？"},
                    
            
                    @{@"name":@"How is it going?",@"desc":@"the pronunciation of a Jpanese\n tyousi-dou?",@"favoriteflag":@"0",@"sounddate":@"調子どう？"
                      },];
//        }
    

    _usefulData1 = useful1.mutableCopy;
//    _usefulDate2 = useful2.mutableCopy;
    //ここにサウンドをたす
    NSString *path;
    id favoriteflag;
   if (self.section_num == 0) {
        //タイトルにとはとつける
        self.myExplanLabel.text = [NSString stringWithFormat:@"About→%@",_usefulData1[self.select_num][@"name"]];
        //説明を表示する
        self.descriptionText.text = _usefulData1[self.select_num][@"desc"];
        //favoriteflagを取り出す
        favoriteflag = _usefulData1[self.select_num][@"favoriteflag"];
        //audioプレイヤーの作成
        path = [[NSBundle mainBundle] pathForResource:_usefulData1[self.select_num][@"sounddate"] ofType:@"m4a"];
    }
//    else{
//        self.myExplanLabel.text = [NSString stringWithFormat:@"About→%@",_usefulDate2[self.select_num][@"name"]];
//        
//        self.descriptionText.text = _usefulDate2[self.select_num][@"desc"];
//        
//        favoriteflag = _usefulDate2[self.select_num][@"favoriteflag"];
//        
//        path = [[NSBundle mainBundle] pathForResource:_usefulDate2[self.select_num][@"sounddate"] ofType:@""];
//        
//    }
    
//    intvalueでfavoriteflagを整数型にする
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        //ボタンの表示
        [self.favoriteBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
    }else{
        [self.favoriteBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
    }
   //パスから再生プレイヤーを作成する
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    //audioを再生するプレイヤーを作成する
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    //エラーが起きたとき
    if (error !=nil) {
        NSLog(@"Error %@",[error localizedDescription]);
    }
    //自分自身をデリケートに設定
    [self.audioPlayer setDelegate:self];

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
    }
//    else{
//        
//        selectteduseful = _usefulDate2[self.select_num];
//        
//        changedUseful = selectteduseful.mutableCopy;
//       
//        favoriteflag = _usefulDate2[self.select_num][@"favoriteflag"];
//
//    
//    }
    //int型に代入
    int intFavFlag = [favoriteflag intValue];
    
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
    }
//    else{
//        [_usefulDate2 replaceObjectAtIndex:self.select_num withObject:changedUseful];
//        
//        [defaults setObject:_usefulDate2 forKey:@"usefulTable2"];
//    }
    [defaults synchronize];//userdefaultにきちんと保存される
    
}
- (IBAction)playAudio:(id)sender {
    //ボタンが押されると再生、停止の記述を追加
    
    if (self.audioPlayer.playing) {
        [self.audioPlayer stop];
        //[self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }else{
        [self.audioPlayer play];
        //[self.playButton setTitle:@"Stop" forState:UIControlStateNormal];
    }

}
@end
