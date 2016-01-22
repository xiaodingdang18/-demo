//
//  QustionKuListController.m
//  QustionList
//
//  Created by WinterLin on 15/12/28.
//  Copyright © 2015年 WinterLin. All rights reserved.
//

#import "QustionKuListController.h"
#import "QustionListController.h"

@interface QustionKuListController ()


@property (strong, nonatomic) NSArray *questionKuNameArr;

@end

@implementation QustionKuListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self analyzeQuestionList];
    });
    
}


- (void)analyzeQuestionList
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"QuestionPlist" ofType:@"plist"];
    NSDictionary *QuestionDic = [NSDictionary dictionaryWithContentsOfFile:plistPath ];
    
    self.questionKuNameArr = [QuestionDic allKeys];
    NSLog(@"questionDic is  %@ =======\n  %@",QuestionDic,[QuestionDic allKeys]);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
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

    return self.questionKuNameArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.questionKuNameArr[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ToQustionList" sender:self.questionKuNameArr[indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    QustionListController *listController = segue.destinationViewController;
    listController.questionKu = sender;

}
@end
