//
//  ViewController.h
//  wit-ai-test
//
//  Created by Oren Kosto on 1/6/15.
//  Copyright (c) 2015 Panda-OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Wit/Wit.h>

@interface ViewController : UIViewController <WitDelegate>

@property (weak, nonatomic) IBOutlet WITMicButton *witButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *intentLabel;

@end

