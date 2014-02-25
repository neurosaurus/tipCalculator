//
//  TGPhotoViewController.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/24/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TGPhotoViewController.h"

@interface TGPhotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TGPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
