//
//  ViewController.m
//  RootlessColor
//
//  Created by Allison Husain on 7/2/17.
//  Copyright © 2017 Allison Husain. All rights reserved.
//

#import "ViewController.h"
#import "GammaController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float red = [defaults floatForKey:@"red"];
    float green = [defaults floatForKey:@"green"];
    float blue = [defaults floatForKey:@"blue"];
    
    //Check if it's first launch
    if (red == 0 && green == 0 && blue == 0) {
        //Yes! Dump some default values in
        [defaults setFloat:1 forKey:@"red"];
        [defaults setFloat:1 forKey:@"green"];
        [defaults setFloat:1 forKey:@"blue"];
        [defaults synchronize];
        red = 1;
        green = 1;
        blue = 1;
    }
    
    _redSlider.value = red;
    _greenSlider.value = green;
    _blueSlider.value = blue;
    [self updateDisplayColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redDidChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self updateColorValue:@"red" andValue:slider.value];
    [self updateDisplayColor];
}
- (IBAction)greenDidChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self updateColorValue:@"green" andValue:slider.value];
    [self updateDisplayColor];
}
- (IBAction)blueDidChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self updateColorValue:@"blue" andValue:slider.value];
    [self updateDisplayColor];
}

- (IBAction)enableChanged:(id)sender {
    UISwitch *enabled = (UISwitch *)sender;
    if (enabled.isOn) {
        [self updateDisplayColor];
    }else {
        [GammaController setGammaWithRed:1 green:1 blue:1];
    }
}

-(void)updateColorValue:(NSString *)forColorName andValue:(float)withValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:withValue forKey:forColorName];
    [defaults synchronize];
}

-(void)updateDisplayColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float red = [defaults floatForKey:@"red"];
    float green = [defaults floatForKey:@"green"];
    float blue = [defaults floatForKey:@"blue"];
    
    [GammaController setGammaWithRed:red green:green blue:blue];
}


@end
