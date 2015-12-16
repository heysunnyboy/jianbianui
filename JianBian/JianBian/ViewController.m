//
//  ViewController.m
//  JianBian
//
//  Created by sunny on 15/12/16.
//  Copyright © 2015年 maja. All rights reserved.
//

#import "ViewController.h"
#import "JianBianTableViewCell.h"
@interface ViewController ()
@property(strong,nonatomic) UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerNib:[UINib nibWithNibName:@"JianBianTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    JianBianTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setJianBianWithBeforeColor:[self getCurrentBeforeColor:[UIColor greenColor] afterColor:[UIColor redColor] percent:1.0*indexPath.row/5] afterColr:[self getCurrentBeforeColor:[UIColor greenColor] afterColor:[UIColor redColor] percent:1.0*(indexPath.row+1)/5]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect rect = cell.frame;
    rect.origin.y = rect.origin.y = 60;
    cell.frame = rect;
    cell.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        CGRect rect = cell.frame;
        rect.origin.y = rect.origin.y - 60;
        cell.frame = rect;
        cell.alpha = 1;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIColor *)getCurrentBeforeColor:(UIColor *)beforeColor afterColor:(UIColor*)afterColor percent:(CGFloat)percent{
    CGFloat R, G, B;
    int numComponents = CGColorGetNumberOfComponents([beforeColor CGColor]);
    
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents([beforeColor CGColor]);
        R = components[0];
        G = components[1];
        B = components[2];
    }
    CGFloat R2, G2, B2;
    int numComponents2 = CGColorGetNumberOfComponents([afterColor CGColor]);
    
    if (numComponents2 == 4)
    {
        const CGFloat *components2 = CGColorGetComponents([afterColor CGColor]);
        R2 = components2[0];
        G2 = components2[1];
        B2 = components2[2];
    }
    //    CGFloat currentR =
    return [UIColor colorWithRed:R+(R2-R)*percent green:G+(G2-G)*percent blue:B+(B2-B)*percent alpha:1.0];
}
@end
