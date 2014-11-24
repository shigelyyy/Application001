//
//  MenuViewController.h
//  Application001
//
//  Created by user on 2014/11/09.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *myUsefulButton;
@property (weak, nonatomic) IBOutlet UIButton *myFunnyButton;
@property (weak, nonatomic) IBOutlet UIButton *myFavoriteButton;
- (IBAction)UsefulAction:(id)sender;
- (IBAction)myFTB:(id)sender;

@end
