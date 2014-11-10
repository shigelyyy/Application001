//
//  ExplanViewController.h
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplanViewController : UIViewController{
    NSArray *_usefulData1;
    NSArray *_usefulDate2;


}
@property (weak, nonatomic) IBOutlet UILabel *myExplanLabel;
@property (nonatomic,assign) int select_num;
@end
