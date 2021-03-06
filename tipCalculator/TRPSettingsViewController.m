//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/19/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TRPSettingsViewController.h"

@interface TRPSettingsViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *defaultPercent;

@end

@implementation TRPSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UITabBarItem *tbi = self.tabBarItem;
        
        tbi.title = @"Settings";
        
        UIImage *i = [UIImage imageNamed:@"gear_selected.png"];
        tbi.image = i;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tipPercent = @[@"10%", @"15%", @"20%"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [defaults integerForKey:@"defPercent"];
    [self.defaultPercent selectRow:index
                       inComponent:0
                          animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:
    (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
    numberOfRowsInComponent:(NSInteger)component
{
    return self.tipPercent.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return self.tipPercent[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:row forKey:@"defPercent"];
    [defaults synchronize];
}

@end
