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
    //ボタンの背景の角丸を作る
    [[self.slowButton layer] setCornerRadius:10.0];
    [self.slowButton setClipsToBounds:YES];
    [[self.slowButton layer] setBorderColor:[[UIColor lightTextColor] CGColor]];
    [[self.slowButton layer] setBorderWidth:1.5];
    
    //こっちも
    [[self.playButton layer] setCornerRadius:10.0];
    [self.playButton setClipsToBounds:YES];
    [[self.playButton layer] setBorderColor:[[UIColor lightTextColor] CGColor]];
    [[self.playButton layer] setBorderWidth:1.5];
    
    [[self.favoriteBtn layer] setCornerRadius:10.0];
    [self.favoriteBtn setClipsToBounds:YES];
    [[self.favoriteBtn layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.favoriteBtn layer] setBorderWidth:1.5];
    

    
    //textvieを丸くした
    [[self.descriptionText layer] setCornerRadius:10.0];
    [self.descriptionText setClipsToBounds:YES];
    [[self.descriptionText layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.descriptionText layer] setBorderWidth:1.5];
    
    self.myExplanLabel.textColor = [UIColor whiteColor];
    

    
    // Do any additional setup after loading the view.
    NSError *error = nil;
    
    //ユーザーデフォルトからデータを取り出す箱を取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *useful1;
    NSArray *funnyTmp;
    NSArray *greeTmp;
    
    funnyTmp = [defaults objectForKey:@"funnyTable"];
    
   if (funnyTmp == nil){
    
        funnyTmp = @[@{@"name":@"People who have a fulfilling life./おめえりあじゅうかよ",@"desc":@"pronunce\n omee-riazyuu-kayo",@"favoriteflag":@"0",@"sounddate":@"おめえリア充かよ"},
       
                     @{@"name":@"Oh no, not again./またかよ",@"desc":@"pronunce\n mata-kayo",@"favoriteflag":@"0",@"sounddate":@"またかよ"},
                     
                     @{@"name":@"lol/わろた",@"desc":@"pronunce\n warota ",@"favoriteflag":@"0",@"sounddate":@"わろた"},
                     
                     @{@"name":@"Are you serious?/まじかよ",@"desc":@"pronunce\n　mazi-kayo ",@"favoriteflag":@"0",@"sounddate":@"マジかよ"},
                     
                     @{@"name":@"Leave it to me./おれにまかせろ ",@"desc":@"pronunce\n　oreni-makasero ",@"favoriteflag":@"0",@"sounddate":@"俺に任せろ"},
                     
                     @{@"name":@"That doesn't matter./もんだいないよ",@"desc":@"pronunce\n mondai-naiyo ",@"favoriteflag":@"0",@"sounddate":@"問題ないよ"},
                     
                     @{@"name":@"You're kidding me!/うそだろ",@"desc":@"pronunce\n　uso-daro",@"favoriteflag":@"0",@"sounddate":@"嘘だろ"},
                     
                     @{@"name":@"You are genius./てんさいかよ",@"desc":@"pronunce\n tensai-kayo",@"favoriteflag":@"0",@"sounddate":@"天才かよ"},
                     
                     @{@"name":@"Awesome./さいこうかよ",@"desc":@"pronunce\n saiko",@"favoriteflag":@"0",@"sounddate":@"最高"},
                     
                     @{@"name":@"Leave it to me./わたしにまかせて",@"desc":@"pronunce\n　watasini-maka-sete (women) ",@"favoriteflag":@"0",@"sounddate":@"私に任せて"},
                     
                     @{@"name":@"I will cancel my classes./じしゅきゅうこうします",@"desc":@"pronunce\n zisyukyuukou-simasu",@"favoriteflag":@"0",@"sounddate":@"自主休講します"},
                     
                     @{@"name":@"It's hopeless./つんだー",@"desc":@"pronunce\n tunda-",@"favoriteflag":@"0",@"sounddate":@"詰んだー"},
                     
                     @{@"name":@"It's delicious./うっっっっま",@"desc":@"pronunce\n uma ",@"favoriteflag":@"0",@"sounddate":@"うっっっっま"},
                     
                     @{@"name":@"Oh, I see!/あーね",@"desc":@"pronunce\n a-ne",@"favoriteflag":@"0",@"sounddate":@"あーね"},
                     
                     @{@"name":@"I blew it./やっちまった",@"desc":@"pronunce\n yatti-matta",@"favoriteflag":@"0",@"sounddate":@"やっちまった"},
                     
                     @{@"name":@"I only want love and warmth./ただあいとぬくもりがほしい",@"desc":@"pronunce\n tada-ai-to-nukumori-ga-hosii",@"favoriteflag":@"0",@"sounddate":@"ただ愛とぬくもりが欲しい"},
                     
                     @{@"name":@"I know, right?/それな",@"desc":@"pronunce\n sorena",@"favoriteflag":@"0",@"sounddate":@"それな"},
                     
                     
        ];
    }
    _funnyArray = funnyTmp.mutableCopy;
    
    //保存されたデータを取り出す
    useful1 = [defaults objectForKey:@"usefulTable1"];

    //nilは何もないという状態
    if (useful1 == nil) {
            useful1 = @[
            
                    @{@"name":@"who is that?/あのひとだれ？",@"desc":@"pronunce\n ano-hito-dare?",@"favoriteflag":@"0",@"sounddate":@"あの人誰？"},
                    
                    @{@"name":@"what's the best thing to do?/どうしたらいいの？",@"desc":@"pronunce\n dousitara-ii-no?",@"favoriteflag":@"0",@"sounddate":@"どうしたらいいの"},
                    
                    @{@"name":@"Where are you going?/どこいくの？",@"desc":@"pronunce\n doko-iku-no?",@"favoriteflag":@"0",@"sounddate":@"どこいくの？"},
                    
                    @{@"name":@"Where are you now?/どこいんの？",@"desc":@"pronunce\n　doko-iru-no? ",@"favoriteflag":@"0",@"sounddate":@"どこいんの？"},
                    
                    @{@"name":@"Where are you from?/どこしゅっしんですか？ ",@"desc":@"pronunce\n doko-syussinn-desu-ka",@"favoriteflag":@"0",@"sounddate":@"どこ出身ですか？"},
                    
                    @{@"name":@"why?/なんで？",@"desc":@"pronunce\n nann-de ",@"favoriteflag":@"0",@"sounddate":@"なんで？"},
                    
                    @{@"name":@"What’s your plan for today？/きょうよていある？",@"desc":@"pronunce\n kyou-yotei-aru?",@"favoriteflag":@"0",@"sounddate":@"今日予定ある？"},
                    
                    @{@"name":@"When are you back home today?/きょうなんじにかえる？",@"desc":@"pronunce\n kyou-nannzi-ni-kaeru?",@"favoriteflag":@"0",@"sounddate":@"今日何時に帰る？"},
                    
                    @{@"name":@"What are you doing?/なにしてんの？",@"desc":@"pronunce\n nani-siteru-no?",@"favoriteflag":@"0",@"sounddate":@"何してんの？"},
                    
            
                    @{@"name":@"How is it going?/ちょうしどう？",@"desc":@"pronunce\n tyousi-dou?",@"favoriteflag":@"0",@"sounddate":@"調子どう？"},
                    
                    @{@"name":@"What time is it?/いまなんじですか？",@"desc":@"pronunce\n ima-nannzi?",@"favoriteflag":@"0",@"sounddate":@"今何時ですか？"},
                    
                    @{@"name":@"How much is it?/それいくら？",@"desc":@"pronunce\n sore-ikura?",@"favoriteflag":@"0",@"sounddate":@"それいくら？"},
                    
                    
                    ];
      }


    _usefulData1 = useful1.mutableCopy;
    
    //保存されたデータを取り出す
    greeTmp =[defaults objectForKey:@"greeTable"];
    
    if (greeTmp == nil){
        greeTmp = @[@{@"name":@"Let's eat./いただきます",@"desc":@"pronunce\n itadaki-masu ",@"favoriteflag":@"0",@"sounddate":@"いただきます"},
                    
                    @{@"name":@"good morning./おはよ",@"desc":@"pronunce\n ohayo",@"favoriteflag":@"0",@"sounddate":@"おはよ"},
                    
                    @{@"name":@"Welcome back./おかえり",@"desc":@"pronunce\n okaeri",@"favoriteflag":@"0",@"sounddate":@"おかえり"},
                    
                    @{@"name":@"I'm leaving./いってきます",@"desc":@"pronunce\n　itteki-masu ",@"favoriteflag":@"0",@"sounddate":@"行ってきます"},
                    
                    @{@"name":@"Thanks for the nice meal./ごちそうさま",@"desc":@"pronunce\n　gotisou-sama ",@"favoriteflag":@"0",@"sounddate":@"ごちそうさま"},
                    
                    @{@"name":@"See you! have a good day./いってらっしゃい",@"desc":@"pronunce\n itte-ra-sshai",@"favoriteflag":@"0",@"sounddate":@"いってらっしゃい"},
                    
                    @{@"name":@"I'm home./ただいま",@"desc":@"pronunce\n tadaima ",@"favoriteflag":@"0",@"sounddate":@"ただいま"},
                    
                    @{@"name":@"You've gotta be tired./おつかれさま",@"desc":@"pronunce\n otukare-sama",@"favoriteflag":@"0",@"sounddate":@"おつかれさま"},
                    
                    
                    
                    
                    
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
//if (self.audioPlayer.playing) {
//    [self.audioPlayer stop];
//    //[self.playButton setTitle:@"Play" forState:UIControlStateNormal];
//}else{
//    self.audioPlayer.enableRate = YES;
//    [self.audioPlayer setRate:0.6];
//    [self.audioPlayer play];
//    //[self.playButton setTitle:@"Stop" forState:UIControlStateNormal];
//}



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

- (IBAction)slowVoiceBtn:(id)sender {
    if (self.audioPlayer.playing) {
        [self.audioPlayer stop];
        //[self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }else{
        self.audioPlayer.enableRate = YES;
        [self.audioPlayer setRate:0.6];
        [self.audioPlayer play];
        //[self.playButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

    
- (IBAction)playAudio:(id)sender {
    //ボタンが押されると再生、停止の記述を追加
    if (self.audioPlayer.playing) {
        [self.audioPlayer stop];
        //[self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }else{
        self.audioPlayer.enableRate = YES;
        [self.audioPlayer setRate:1];
        [self.audioPlayer play];
        //[self.playButton setTitle:@"Stop" forState:UIControlStateNormal];
    }

    
    

}
@end
