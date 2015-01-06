//
//  ViewController.m
//  wit-ai-test
//
//  Created by Oren Kosto on 1/6/15.
//  Copyright (c) 2015 Panda-OS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

double delayInSeconds = 3.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [Wit sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)witDidGraspIntent:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id)customData error:(NSError *)e
{
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    NSDictionary *firstOutcome = [outcomes objectAtIndex:0];
    NSString *intent = [firstOutcome objectForKey:@"intent"];
    NSString *message = [firstOutcome objectForKey:@"_text"];
    self.messageLabel.text = [NSString stringWithFormat:@"You said: %@", message];
    self.intentLabel.text = [NSString stringWithFormat:@"You meant: %@", intent];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.messageLabel.text = @"Say Something!";
        self.intentLabel.text = @" ";
    });
    
}

@end
