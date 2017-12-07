//
//  ViewController.m
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark Private method

- (void) fetchWeatherData
{
    __weak ViewController *weakSelf = self;
    void (^finished) (NSDictionary*) = ^(NSDictionary *info) {
        [weakSelf fetchWeatherInfoFinished:info];
    };
    [[RUService instance] getWeatherDataWithCityName:[[NSString stringWithFormat:@"%@", @"北京"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dtype:@"json" format:1 block:finished];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark View lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blackColor];
    button.frame = CGRectMake((self.view.bounds.size.width-100)/2, (self.view.bounds.size.height-42)/2, 100, 42);
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.0f;
    button.layer.cornerRadius = 5.0f;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [button setTitle:@"获取" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(weatherAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark -
#pragma mark Click action

- (void) weatherAction
{
    if (!isFetch) {
        isFetch = YES;
        [self fetchWeatherData];
    }
}

#pragma mark  -
#pragma mark Fetch data

- (void) fetchWeatherInfoFinished:(NSDictionary*)info
{
    NSLog(@"info:%@", info);
    isFetch = NO;
}

@end
