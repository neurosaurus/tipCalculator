//
//  TIPViewController.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/17/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TIPViewController.h"
#import "SettingsViewController.h"

@interface TIPViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) NSArray *tipValues;
@property (weak, nonatomic) IBOutlet UITextField *numberPeople;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPerson;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;


@end

@implementation TIPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(onSettingsButton)];
    [self updateValues];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTip = [defaults integerForKey:@"defPercent"];
    [self.tipControl setSelectedSegmentIndex:defaultTip];
    
    [self updateValues];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender
{
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues
{
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    float people = [self.numberPeople.text floatValue];
    if (people == 0.0) {
        people = 1.0;
    };
    float eachPerson = (totalAmount / people);
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.amountPerPerson.text = [NSString stringWithFormat:@"$%0.2f", eachPerson];
}

- (void)onSettingsButton
{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
