//
//  TGPhotoViewController.m
//  tipCalculator
//
//  Created by Tripta Gupta on 2/24/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TRPImageViewController.h"
#import "TRPImage.h"
#import "TRPImageStore.h"

@interface TRPImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;


@end

@implementation TRPImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        
        tbi.title = @"Receipts";
        
        UIImage *i = [UIImage imageNamed:@"photos_selected.png"];
        tbi.image = i;
    
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
//        _itemKey = key;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    TGImage *image = self.item;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
//    [[TRPImageStore sharedStore] setImage:image
//                                   forKey:self.photo.itemKey];
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
