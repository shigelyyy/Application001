//
//  FavoriteViewController.m
//  Application001
//
//  Created by user on 2014/11/12.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "FavoriteViewController.h"
#import "ExplanViewController.h"


@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view.
        self.title = @"FavoriteList";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *useful1;
    NSArray *funnyTmp;
    NSArray *greeTmp;
    
    //保存されたデータを取り出す
    useful1 = [defaults objectForKey:@"usefulTable1"];
    //useful2 = [defaults objectForKey:@"usefulTable2"];
    if (useful1 == nil) {
        useful1 = @[
                    
                    @{@"name":@"who is that?",@"desc":@"pronunce\n ano-hito-dare?",@"favoriteflag":@"0",@"sounddate":@"あの人誰？"},
                    
                    @{@"name":@"what's the best thing to do?",@"desc":@"pronunce\n dousitara-ii-no?",@"favoriteflag":@"0",@"sounddate":@"どうしたらいいの"},
                    
                    @{@"name":@"Where are you going?",@"desc":@"pronunce\n doko-iku-no?",@"favoriteflag":@"0",@"sounddate":@"どこいくの？"},
                    
                    @{@"name":@"Where are you now?",@"desc":@"pronunce\n　doko-iru-no? ",@"favoriteflag":@"0",@"sounddate":@"どこいんの？"},
                    
                    @{@"name":@" Where are you from? ",@"desc":@"pronunce\n doko-syussinn-desu-ka",@"favoriteflag":@"0",@"sounddate":@"どこ出身ですか？"},
                    
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
    
    
    funnyTmp = [defaults objectForKey:@"funnyTable"];
    
    if(funnyTmp == nil){
        funnyTmp = @[@{@"name":@"People who have a fulfilling life.",@"desc":@"pronunce\n omee-riazyuu-kayo     ",@"favoriteflag":@"0",@"sounddate":@"おめえリア充かよ"},
                     
                     @{@"name":@"Oh no, not again.",@"desc":@"pronunce\n mata-kayo",@"favoriteflag":@"0",@"sounddate":@"またかよ"},
                     
                     @{@"name":@"lol",@"desc":@"pronunce\n warota ",@"favoriteflag":@"0",@"sounddate":@"わろた"},
                     
                     @{@"name":@"Are you serious?",@"desc":@"pronunce\n　mazi-kayo ",@"favoriteflag":@"0",@"sounddate":@"マジかよ"},
                     
                     @{@"name":@"Believe it to me",@"desc":@"pronunce\n　oreni-makasero ",@"favoriteflag":@"0",@"sounddate":@"俺に任せろ"},
                     
                     @{@"name":@"That doesn't matter.",@"desc":@"pronunce\n mondai-naiyo ",@"favoriteflag":@"0",@"sounddate":@"問題ないよ"},
                     
                     @{@"name":@"You're kidding me!",@"desc":@"pronunce\n　uso-daro",@"favoriteflag":@"0",@"sounddate":@"嘘だろ"},
                     
                     @{@"name":@"You are genius.",@"desc":@"pronunce\n tensai-kayo",@"favoriteflag":@"0",@"sounddate":@"天才かよ"},
                     
                     @{@"name":@"Awesome.",@"desc":@"pronunce\n saiko",@"favoriteflag":@"0",@"sounddate":@"最高"},
                     
                     @{@"name":@"Believe it to me",@"desc":@"pronunce\n　watasini-maka-sete (women) ",@"favoriteflag":@"0",@"sounddate":@"私に任せて"},
                     
                     @{@"name":@"I will cancel one's classes.",@"desc":@"pronunce\n zisyukyuukou-simasu",@"favoriteflag":@"0",@"sounddate":@"自主休講します"},
                     
                     @{@"name":@"It's hopeless.",@"desc":@"pronunce\n tunda-",@"favoriteflag":@"0",@"sounddate":@"詰んだー"},
                     ];

    }
            _funnyArray = funnyTmp.mutableCopy;
    
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


    
    
    //検索用編集可能配列
    NSMutableArray *tmpusefulArray = useful1.mutableCopy;
    NSMutableArray *tmpfunnyArray = funnyTmp.mutableCopy;
    NSMutableArray *tmpgreeArray = greeTmp.mutableCopy;
    
    
    for (NSDictionary *useful_each in tmpusefulArray) {
        id favoriteflag = useful_each[@"favoriteflag"];
    //取り出したid型をint型に変換
        int intFavFlag = [favoriteflag intValue];
        if (intFavFlag == 0) {
            [_usefulData1 removeObject:useful_each];
        }
    
    }
    
    for (NSDictionary *funnyArray_each in tmpfunnyArray){
        id favoriteflag = funnyArray_each[@"favoriteflag"];
        
        int intFavFlag = [favoriteflag intValue];
        if (intFavFlag == 0){
            [_funnyArray removeObject:funnyArray_each];
        }
    
    }
    for (NSDictionary *greeArray_each in tmpgreeArray){
        id favoriteflag = greeArray_each[@"favoriteflag"];
        
        int intFavFlag = [favoriteflag intValue];
        if (intFavFlag == 0){
            [_greeArray removeObject:greeArray_each];
        }
        
    }

    //重要　コーヒーとフードのお気に入りを合体させる
    _useArray = _usefulData1.mutableCopy;
    [_useArray addObjectsFromArray:_funnyArray];
    [_useArray addObjectsFromArray:_greeArray];

    
    _myFavoriteTableview.delegate = self;
    _myFavoriteTableview.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return _useArray.count;
    
}
//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//定数を宣言
    static NSString *CellIdentifer = @"Cell";
    //セルを再利用
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifer];
    if (cell == nil) {
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
     cell.textLabel.text = _useArray[indexPath.row][@"name"];
    
    return cell;



}
//何か行が押されたときにExplanVIewControllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Tap:%d",indexPath.row);
    //画面遷移のカプセル化
    ExplanViewController *evc = [self.storyboard instantiateViewControllerWithIdentifier: @"ExplanViewController"];
    //押された行数だけでなく、お気に入りもそうでないものも全て入っているリストから番号を検索する
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *useful1;
    
    //保存されたデータを取り出す
   
        useful1 = [defaults objectForKey:@"usefulTable1"];
    
        if (useful1 == nil) {
            useful1 = @[
                        
                        @{@"name":@"who is that?",@"desc":@"pronunce\n ano-hito-dare?",@"favoriteflag":@"0",@"sounddate":@"あの人誰？"},
                        
                        @{@"name":@"what's the best thing to do?",@"desc":@"pronunce\n dousitara-ii-no?",@"favoriteflag":@"0",@"sounddate":@"どうしたらいいの"},
                        
                        @{@"name":@"Where are you going?",@"desc":@"pronunce\n doko-iku-no?",@"favoriteflag":@"0",@"sounddate":@"どこいくの？"},
                        
                        @{@"name":@"Where are you now?",@"desc":@"pronunce\n　doko-iru-no? ",@"favoriteflag":@"0",@"sounddate":@"どこいんの？"},
                        
                        @{@"name":@" Where are you from? ",@"desc":@"pronunce\n doko-syussinn-desu-ka",@"favoriteflag":@"0",@"sounddate":@"どこ出身ですか？"},
                        
                        @{@"name":@"why?",@"desc":@"pronunce\n nann-de ",@"favoriteflag":@"0",@"sounddate":@"なんで？"},
                        
                        @{@"name":@"What’s your plan for today？",@"desc":@"pronunce\n kyou-yotei-aru?",@"favoriteflag":@"0",@"sounddate":@"今日予定ある？"},
                        
                        @{@"name":@"When are you back home today?",@"desc":@"pronunce\n kyou-nannzi-ni-kaeru?",@"favoriteflag":@"0",@"sounddate":@"今日何時に帰る？"},
                        
                        @{@"name":@"What are you doing?",@"desc":@"pronunce\n nani-siteru-no?",@"favoriteflag":@"0",@"sounddate":@"何してんの？"},
                        
                        
                        @{@"name":@"How is it going?",@"desc":@"pronunce\n tyousi-dou?",@"favoriteflag":@"0",@"sounddate":@"調子どう？"},
                        
                        @{@"name":@"What time is it?",@"desc":@"pronunce\n ima-nannzi?",@"favoriteflag":@"0",@"sounddate":@"今何時ですか？"},
                        
                        @{@"name":@"How much is it?",@"desc":@"pronunce\n sore-ikura?",@"favoriteflag":@"0",@"sounddate":@"それいくら？"},
                        
                        
                        ];
        }
        int index = 0;
    
        BOOL checkFlag = NO;
    
        for (NSDictionary *useful_each in useful1) {
            NSString *name = useful_each[@"name"];
            //名前が同じ者が存在した場合、検索処理を中止する
            if ([name isEqualToString:_useArray[indexPath.row][@"name"]]) {
                checkFlag = YES;
                evc.select_button_num = 1;
                break;
            }
            index++;
        }
        //usefulに存在しない場合、funnyを検索する
    if (!checkFlag){
        NSArray *funnyTmp;
        
        //保存されたデータを取り出す
        funnyTmp = [defaults objectForKey:@"funnyTable"];
        
        if(funnyTmp == nil){
            funnyTmp = @[@{@"name":@"People who have a fulfilling life.",@"desc":@"pronunce\n omee-riazyuu-kayo     ",@"favoriteflag":@"0",@"sounddate":@"おめえリア充かよ"},
                         
                         @{@"name":@"Oh no, not again.",@"desc":@"pronunce\n mata-kayo",@"favoriteflag":@"0",@"sounddate":@"またかよ"},
                         
                         @{@"name":@"lol",@"desc":@"pronunce\n warota ",@"favoriteflag":@"0",@"sounddate":@"わろた"},
                         
                         @{@"name":@"Are you serious?",@"desc":@"pronunce\n　mazi-kayo ",@"favoriteflag":@"0",@"sounddate":@"マジかよ"},
                         
                         @{@"name":@"Believe it to me",@"desc":@"pronunce\n　oreni-makasero ",@"favoriteflag":@"0",@"sounddate":@"俺に任せろ"},
                         
                         @{@"name":@"That doesn't matter.",@"desc":@"pronunce\n mondai-naiyo ",@"favoriteflag":@"0",@"sounddate":@"問題ないよ"},
                         
                         @{@"name":@"You're kidding me!",@"desc":@"pronunce\n　uso-daro",@"favoriteflag":@"0",@"sounddate":@"嘘だろ"},
                         
                         @{@"name":@"You are genius.",@"desc":@"pronunce\n tensai-kayo",@"favoriteflag":@"0",@"sounddate":@"天才かよ"},
                         
                         @{@"name":@"Awesome.",@"desc":@"pronunce\n saiko",@"favoriteflag":@"0",@"sounddate":@"最高"},
                         
                         @{@"name":@"Believe it to me",@"desc":@"pronunce\n　watasini-maka-sete (women) ",@"favoriteflag":@"0",@"sounddate":@"私に任せて"},
                         
                         @{@"name":@"I will cancel one's classes.",@"desc":@"pronunce\n zisyukyuukou-simasu",@"favoriteflag":@"0",@"sounddate":@"自主休講します"},
                         
                         @{@"name":@"It's hopeless.",@"desc":@"pronunce\n tunda-",@"favoriteflag":@"0",@"sounddate":@"詰んだー"},
                         ];
        }
        index = 0;
        checkFlag = NO;
        for (NSDictionary *funny_each in funnyTmp) {
            NSString *name = funny_each[@"name"];
            //名前が同じ者が存在した場合、検索処理を中止する
            if ([name isEqualToString:_useArray[indexPath.row][@"name"]]) {
                checkFlag = YES;
                evc.select_button_num = 2;
                break;
            }
            index++;

        }
    }
    
    if(!checkFlag){
            NSArray *greeTmp;
            
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
            index = 0;
            checkFlag = NO;
            for (NSDictionary *gree_each in greeTmp) {
                NSString *name = gree_each[@"name"];
                //名前が同じ者が存在した場合、検索処理を中止する
                if ([name isEqualToString:_useArray[indexPath.row][@"name"]]) {
                    checkFlag = YES;
                    evc.select_button_num = 3;
                    break;
                }
                index++;
                
            }
        
    
    }
    

    
   
    //検索処理結果の番号を遷移先の画面に渡す
    evc.select_num = index;
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:evc animated:YES];
    



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
