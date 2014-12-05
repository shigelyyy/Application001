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
    //NSArray *useful2;
    //保存されたデータを取り出す
    useful1 = [defaults objectForKey:@"usefulTable1"];
    //useful2 = [defaults objectForKey:@"usefulTable2"];
    if (useful1 == nil) {
        useful1 = @[@{@"name":@"good morning.",@"desc":@"the pronunciation of a Jpanese\n ohayo",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"How is it going?",@"desc":@"the pronunciation of a Jpanese\n gennki?",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"What is the mateter?",@"desc":@"the pronunciation of a Jpanese\n dousita?",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"How have you been?",@"desc":@"the pronunciation of a Jpanese\n gennkidatta?",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"what are you up to?",@"desc":@"the pronunciation of a Jpanese\n nanisiteruno?",@"favoriteflag":@"0",@"sounddate":@""},
                      
                    @{@"name":@"what's on for today?",@"desc":@"the pronunciation of a Jpanese\n kyounoyoteiha?",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"how much is it?",@"desc":@"the pronunciation of a Jpanese\n koreikura?",@"favoriteflag":@"0",@"sounddate":@""},
                    @{@"name":@"when will class last?",@"desc":@"the pronunciation of a Jpanese\n kyouzyugyouituowaru?",@"favoriteflag":@"0",@"sounddate":@""},];
    }

//    if (useful2 == nil) {
//        useful2 = @[@{@"name":@"what are you up to?",@"desc":@"the pronunciation of a Jpanese\n nanisiteruno?",
//                      @"favoriteflag":@"0",@"sounddate":@""},
//                    @{@"name":@"what's on for today?",@"desc":@"the pronunciation of a Jpanese\n kyounoyoteiha?",@"favoriteflag":@"0",@"sounddate":@""},
//                    @{@"name":@"how much is it?",@"desc":@"the pronunciation of a Jpanese\n koreikura?",@"favoriteflag":@"0",@"sounddate":@""},
//                    @{@"name":@"when will class last?",@"desc":@"the pronunciation of a Jpanese\n kyouzyugyouituowaru?",@"favoriteflag":@"0",@"sounddate":@""},];
//        
//    }
//    
    //検索用編集可能配列
    NSMutableArray *tmpusefulArray = useful1.mutableCopy;
    //お気に入りリスト
    _usefulData1 = useful1.mutableCopy;
    for (NSDictionary *useful_each in tmpusefulArray) {
        id favoriteflag = useful_each[@"favoriteflag"];
    //取り出したid型をint型に変換
        int intFavFlag = [favoriteflag intValue];
        if (intFavFlag == 0) {
            [_usefulData1 removeObject:useful_each];
        }
    
    }
//    NSMutableArray *tmpusefulArray2 = useful2.mutableCopy;
//    //お気に入りリスト
//    _usefulDate2 = useful2.mutableCopy;
//    for (NSDictionary *useful_each2 in tmpusefulArray2) {
//        id favoriteflag = useful_each2[@"favoriteflag"];
//        //取り出したid型をint型に変換
//        int intFavFlag = [favoriteflag intValue];
//        if (intFavFlag == 0) {
//            [_usefulDate2 removeObject:useful_each2];
//        }
//    }
    _myFavoriteTableview.delegate = self;
    _myFavoriteTableview.dataSource = self;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
   // if (section == 0) {
        return @"Greeting";
    //}
//    else{
//    return @"5W1H";
//    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //if (section == 0) {
        return _usefulData1.count;
//    }else{
//        return _usefulDate2.count;
//    }
    

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
    if (indexPath.section == 0) {
        cell.textLabel.text = _usefulData1[indexPath.row][@"name"];
    }
//    else{
//        cell.textLabel.text = _usefulDate2[indexPath.row][@"name"];
//    }
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
    //戻す時の番号を指定する
    int index = 0;
    //保存されたデータを取り出す
    if (indexPath.section == 0) {
        useful1 = [defaults objectForKey:@"usefulTable1"];
    
        if (useful1 == nil) {
            useful1 = @[@{@"name":@"good morning.",@"desc":@"the pronunciation of a Jpanese\n ohayo",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"How is it going?",@"desc":@"the pronunciation of a Jpanese\n gennki?",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"What is the mateter?",@"desc":@"the pronunciation of a Jpanese\n dousita?",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"How have you been?",@"desc":@"the pronunciation of a Jpanese\n gennkidatta?",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"what are you up to?",@"desc":@"the pronunciation of a Jpanese\n nanisiteruno?",@"favoriteflag":@"0",@"sounddate":@""},
                          
                        @{@"name":@"what's on for today?",@"desc":@"the pronunciation of a Jpanese\n kyounoyoteiha?",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"how much is it?",@"desc":@"the pronunciation of a Jpanese\n koreikura?",@"favoriteflag":@"0",@"sounddate":@""},
                        @{@"name":@"when will class last?",@"desc":@"the pronunciation of a Jpanese\n kyouzyugyouituowaru?",@"favoriteflag":@"0",@"sounddate":@""},];
        }
        for (NSDictionary *useful_each in useful1) {
            NSString *name = useful_each[@"name"];
            //名前が同じ者が存在した場合、検索処理を中止する
            if ([name isEqualToString:_usefulData1[indexPath.row][@"name"]]) {
                break;
            }
            index++;
        }
    
    }
    
//    else{
//        useful1 = [defaults objectForKey:@"usefulTable2"];
//        if (useful1 == nil) {
//            useful1 =  @[@{@"name":@"what are you up to?",@"desc":@"the pronunciation of a Jpanese\n nanisiteruno?",
//                           @"favoriteflag":@"0",@"sounddate":@""},
//                         @{@"name":@"what's on for today?",@"desc":@"the pronunciation of a Jpanese\n kyounoyoteiha?",@"favoriteflag":@"0",@"sounddate":@""},
//                         @{@"name":@"how much is it?",@"desc":@"the pronunciation of a Jpanese\n koreikura?",@"favoriteflag":@"0",@"sounddate":@""},
//                         @{@"name":@"when will class last?",@"desc":@"the pronunciation of a Jpanese\n kyouzyugyouituowaru?",@"favoriteflag":@"0",@"sounddate":@""},];
//            
//        }
//        for (NSDictionary *useful_each in useful1) {
//            NSString *name = useful_each[@"name"];
//            //名前が同じ者が存在した場合、検索処理を中止する
//            if ([name isEqualToString:_usefulDate2[indexPath.row][@"name"]]) {
//                break;
//            }
//            index++;
//        }
//}
    
    //セクションの遷移先に画面移す
    evc.section_num = indexPath.section;
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
