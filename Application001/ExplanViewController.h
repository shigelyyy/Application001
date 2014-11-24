//
//  ExplanViewController.h
//  Application001
//
//  Created by user on 2014/11/07.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplanViewController : UIViewController{
    NSMutableArray *_usefulData1;
    NSMutableArray *_usefulDate2;


}
@property (weak, nonatomic) IBOutlet UILabel *myExplanLabel;
@property (nonatomic,assign) int select_num;
@property (nonatomic,assign) int section_num;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;
- (IBAction)addFavoriteList:(id)sender;
@end
