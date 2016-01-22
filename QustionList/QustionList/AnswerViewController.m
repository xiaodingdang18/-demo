//
//  AnswerViewController.m
//  QustionList
//
//  Created by WinterLin on 15/12/28.
//  Copyright © 2015年 WinterLin. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;


@property (copy, nonatomic) NSString *answerString;

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"answer string is %@",self.answerString);
    
    self.answerTextView.text = self.answerString;
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
