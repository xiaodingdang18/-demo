//
//  QustionListController.m
//  QustionList
//
//  Created by WinterLin on 15/12/28.
//  Copyright © 2015年 WinterLin. All rights reserved.
//

#import "QustionListController.h"
#import "QuestionModal.h"
#import "AnswerViewController.h"

@interface QustionListController ()


@property (strong, nonatomic) NSMutableArray *questionArr;

@end

@implementation QustionListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.questionArr = [[NSMutableArray alloc]init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self analyzeQuestionList];
    });
    
}

- (void)analyzeQuestionList
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"QuestionPlist" ofType:@"plist"];
    NSDictionary *QuestionDic = [[NSDictionary dictionaryWithContentsOfFile:plistPath ] objectForKey:self.questionKu];
    
    
    
    NSLog(@"question ku is %@",QuestionDic);
    
    for (NSString *key in [QuestionDic allKeys])
    {
        
        QuestionModal *modal = [[QuestionModal alloc] init];
        modal.questionName = key;
        modal.questionContext = [QuestionDic objectForKey:key];
        [self.questionArr addObject:modal];
    }
   // NSLog(@"questionDic is  %@ =======\n  %@",QuestionDic,[QuestionDic allKeys]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.questionArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    QuestionModal *modal = [self.questionArr objectAtIndex:indexPath.row];
    cell.textLabel.text = modal.questionName;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ToAnswerView" sender:self.questionArr[indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(QuestionModal*)sender
{
    AnswerViewController *answerController = segue.destinationViewController;
    [answerController setValue:sender.questionContext forKey:@"answerString" ];
}

@end
