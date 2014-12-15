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
    NSArray *funnyTmp;
    NSArray *greeTmp;
    
    funnyTmp = [defaults objectForKey:@"funnyTable"];
    
   if (funnyTmp == nil){
    
        funnyTmp = @[@{@"name":@"People who have a fulfilling life.",@"desc":@"pronunce\n omee-riazyuu-kayo     ",@"favoriteflag":@"0",@"sounddate":@"おめえリア充かよ"},
       
                     @{@"name":@"Oh no, not again.",@"desc":@"pronunce\n mata-kayo",@"favoriteflag":@"0",@"sounddate":@"またかよ"},
                     
                     @{@"name":@"lol",@"desc":@"pronunce\n warota ",@"favoriteflag":@"0",@"sounddate":@"わろた"},
                     
                     @{@"name":@"Are you serious?",@"desc":@"pronunce\n　mazi-kayo ",@"favoriteflag":@"0",@"sounddate":@"マジかよ"},
                     
                     @{@"name":@"Leave it to me. ",@"desc":@"pronunce\n　oreni-makasero ",@"favoriteflag":@"0",@"sounddate":@"俺に任せろ"},
                     
                     @{@"name":@"That doesn't matter.",@"desc":@"pronunce\n mondai-naiyo ",@"favoriteflag":@"0",@"sounddate":@"問題ないよ"},
                     
                     @{@"name":@"You're kidding me!",@"desc":@"pronunce\n　uso-daro",@"favoriteflag":@"0",@"sounddate":@"嘘だろ"},
                     
                     @{@"name":@"You are genius.",@"desc":@"pronunce\n tensai-kayo",@"favoriteflag":@"0",@"sounddate":@"天才かよ"},
                     
                     @{@"name":@"Awesome.",@"desc":@"pronunce\n saiko",@"favoriteflag":@"0",@"sounddate":@"最高"},
                     
                     @{@"name":@"Believe it to me",@"desc":@"pronunce\n　watasini-maka-sete (women) ",@"favoriteflag":@"0",@"sounddate":@"私に任せて"},
                     
                     @{@"name":@"I will cancel my classes.",@"desc":@"pronunce\n zisyukyuukou-simasu",@"favoriteflag":@"0",@"sounddate":@"自主休講します"},
                     
                     @{@"name":@"It's hopeless.",@"desc":@"pronunce\n tunda-",@"favoriteflag":@"0",@"sounddate":@"詰んだー"},
                     
                     @{@"name":@"It's delicious.",@"desc":@"pronunce\n uma ",@"favoriteflag":@"0",@"sounddate":@"うっっっっま"},
                     
                     @{@"name":@"Oh, I see!",@"desc":@"pronunce\n a-ne",@"favoriteflag":@"0",@"sounddate":@"あーね"},
                     
                     @{@"name":@"I blew it.",@"desc":@"pronunce\n yatti-matta",@"favoriteflag":@"0",@"sounddate":@"やっちまった"},
                     
                     @{@"name":@"I only want love and warmth.",@"desc":@"pronunce\n tada-ai-to-nukumori-ga-hosii",@"favoriteflag":@"0",@"sounddate":@"ただ愛とぬくもりが欲しい"},
                     
                     @{@"name":@"I know, right?",@"desc":@"pronunce\n sorena",@"favoriteflag":@"0",@"sounddate":@"それな"},
                     
                     
        ];
    }
    _funnyArray = funnyTmp.mutableCopy;
    
    //保存されたデータを取り出す
    useful1 = [defaults objectForKey:@"usefulTable1"];

    //nilは何もないという状態
    if (useful1 == nil) {
            useful1 = @[
            
                    @{@"name":@"who is that?",@"desc":@"pronunce\n ano-hito-dare?",@"favoriteflag":@"0",@"sounddate":@"あの人誰？"},
                    
                    @{@"name":@"what's the best thing to do?",@"desc":@"pronunce\n dousitara-ii-no?",@"favoriteflag":@"0",@"sounddate":@"どうしたらいいの"},
                    
                    @{@"name":@"Where are you going?",@"desc":@"pronunce\n doko-iku-no?",@"favoriteflag":@"0",@"sounddate":@"どこいくの？"},
                    
                    @{@"name":@"Where are you now?",@"desc":@"pronunce\n　doko-iru-no? ",@"favoriteflag":@"0",@"sounddate":@"どこいんの？"},
                    
                    @{@"name":@"Where are you from? ",@"desc":@"pronunce\n doko-syussinn-desu-ka",@"favoriteflag":@"0",@"sounddate":@"どこ出身ですか？"},
                    
                    @{@"name":@"why?",@"desc":@"pronunce\n nann-de ",@"favoriteflag":@"0",@"sounddate":@"なんで？"},
                    
                    @{@"name":@"What’s your plan for today？",@"desc":@"pronunce\n kyou-yotei-aru?",@"favoriteflag":@"0",@"sounddate":@"今日予定ある？"},
                    
                    @{@"name":@"When are you back home today?",@"desc":@"pronunce\n kyou-nannzi-ni-kaeru?",@"favoriteflag":@"0",@"sounddate":@"今日何時に帰る？"},
                    
                    @{@"name":@"What are you doing?",@"desc":@"pronunce\n nani-siteru-no?",@"favoriteflag":@"0",@"sounddate":@"何してんの？"},
                    
            
                    @{@"name":@"How is it going?",@"desc":@"pronunce\n tyousi-dou?",@"favoriteflag":@"0",@"sounddate":@"調子どう？"},
                    
                    @{@"name":@"What time is it?",@"desc":@"pronunce\n ima-nannzi?",@"favoriteflag":@"0",@"sounddate":@"今何時ですか？"},
                    
                    @{@"name":@"How much is it?",@"desc":@"pronunce\n sore-ikura?",@"favoriteflag":@"0",@"sounddate":@"それいくら？"},
                    
                    
                    ];
      }


    _usefulData1 = useful1.mutableCopy;
    
    //保存されたデータを取り出す
    greeTmp =[defaults objectForKey:@"greeTable"];
    
    if (greeTmp == nil){
        greeTmp = @[@{@"name":@"Let's eat.",@"desc":@"pronunce\n itadaki-masu ",@"favoriteflag":@"0",@"sounddate":@"いただきます"},
                    
                    @{@"name":@"good morning.",@"desc":@"pronunce\n ohayo",@"favoriteflag":@"0",@"sounddate":@"おはよ"},
                    
                    @{@"name":@"Welcome back.",@"desc":@"pronunce\n okaeri",@"favoriteflag":@"0",@"sounddate":@"おかえり"},
                    
                    @{@"name":@"I'm leaving.",@"desc":@"pronunce\n　itteki-masu ",@"favoriteflag":@"0",@"sounddate":@"行ってきます"},
                    
                    @{@"name":@"Thanks for the nice meal.",@"desc":@"pronunce\n　gotisou-sama ",@"favoriteflag":@"0",@"sounddate":@"ごちそうさま"},
                    
                    @{@"name":@"See you! have a good day.",@"desc":@"pronunce\n itte-ra-sshai",@"favoriteflag":@"0",@"sounddate":@"いってらっしゃい"},
                    
                    @{@"name":@"I'm home.",@"desc":@"pronunce\n tadaima ",@"favoriteflag":@"0",@"sounddate":@"ただいま"},
                    
                    @{@"name":@"You've gotta be tired.",@"desc":@"pronunce\n otukare-sama",@"favoriteflag":@"0",@"sounddate":@"おつかれさま"},
                    
                    
                    
                    
                    
                    ];
    
    }
    _greeArray = greeTmp.mutableCopy;

    if (self.select_button_num == 1){
        _useArray = _usefulData1;
    }else if(self.select_button_num == 2){
        _useArray = _funnyArray;
    }else if(self.select_button_num == 3){
        _useArray = _greeArray;
    }

    self.myExplanLabel.text = [NSString stringWithFormat:@"%@",_useArray[self.select_num][@"name"]];
    
    self.descriptionText.text = [NSString stringWithFormat:@"%@",_useArray[self.select_num][@"desc"]];
    
    id favoriteflag = _useArray[self.select_num][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0){
        [self.favoriteBtn setTitle:@"Add to your Favorites" forState:UIControlStateNormal];
    
    }else{
        [self.favoriteBtn setTitle:@"cancel from Favorites" forState:UIControlStateNormal];
    }
   
    NSString *path = [[NSBundle mainBundle] pathForResource:_useArray[self.select_num][@"sounddate"]                              ofType:@"m4a"];
   
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
//ここも変えなきゃ
- (IBAction)addFavoriteList:(id)sender {
    //まずは変更可能なdictinaly型を作るselectteduseful
    NSDictionary *selectData = _useArray[self.select_num];
    
    NSMutableDictionary *changeData = selectData.mutableCopy;
    
    id favoriteflag = _useArray[self.select_num][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0){
        [changeData setObject:@1 forKey:@"favoriteflag"];
        
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.favoriteBtn setTitle:@"cancel from Favorites" forState:UIControlStateNormal];
        
    }else{
        [changeData setObject:@0 forKey:@"favoriteflag"];
        
        //これからお気に入り解除されるため、ボタン名を追加にセットしておく
        [self.favoriteBtn setTitle:@"Add to your Favorites" forState:UIControlStateNormal];
        
    }
    
    [_useArray replaceObjectAtIndex:self.select_num withObject:changeData];
    
    //userdefaultobjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //文字を保存
    if(self.select_button_num ==1){
        
        [defaults setObject:_useArray forKey:@"usefulTable1"];
        
    }else if(self.select_button_num == 2){
        
        [defaults setObject:_useArray forKey:@"funnyTable"];
    }else if(self.select_button_num == 3){
        [defaults setObject:_useArray forKey:@"greeTable"];
    }
    [defaults synchronize];
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
