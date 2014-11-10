//
//  ViewController.h
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_usefulData1;
    NSArray *_usefulDate2;

}
@property (weak, nonatomic) IBOutlet UITableView *usefulTableView;



@end

