//
//  FavoriteViewController.h
//  Application001
//
//  Created by user on 2014/11/12.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_usefulData1;
    NSMutableArray *_usefulDate2;

}
@property (weak, nonatomic) IBOutlet UITableView *myFavoriteTableview;

@end
