//
//  ViewController.m
//  TipCalculator
//
//  Created by Darlene Wong on 10/18/14.
//  Copyright (c) 2014 Darlene Wong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)tipAmountForBillTotal:(float)billTotal {
    float percentageTip = [self percentageTipWithSegmentedControl:self.tipSegmentedControl];
    NSLog(@"bill total %f",billTotal);
    NSLog(@"percentagetip %f",percentageTip);
    return billTotal * percentageTip;
}

- (float)percentageTipWithSegmentedControl:(UISegmentedControl *)sender {
    NSLog(@"selected segment index: %d", (int) sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"percentageTipWithSegmentedControl: 0.15");
            return 0.15;
            break;
        case 1:
            NSLog(@"percentageTipWithSegmentedControl: 0.18");
            return 0.18;
            break;
        case 2:
            NSLog(@"percentageTipWithSegmentedControl: 0.20");
            return 0.20;
            break;
        default:
            return 0.20;
            break;
    }
}

- (IBAction)percentageChanged:(UISegmentedControl *)sender {
    NSLog(@"percentageChanged: %d",(int)sender.selectedSegmentIndex);
    float percentage = [self percentageTipWithSegmentedControl:sender];
}

#pragma mark - UITextFieldDelegate 

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing: %@",textField.text);
}

#pragma mark - Private Methods

- (IBAction)doneButtonClicked:(id)sender {
    NSLog(@"%@",self.billAmountTextField.text);
    
    // get bill total
    float billTotal = [self.billAmountTextField.text floatValue];
    NSLog(@"Bill Total %f", billTotal);
    
    // get tip amount
    float tipAmount = [self tipAmountForBillTotal:billTotal];
    NSLog(@"Tip Amount %f", tipAmount);
    
    // set text for tip amount label
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tipAmount];
    
    // set total amount (bill + tip) as total label
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",billTotal + tipAmount];
}

@end
