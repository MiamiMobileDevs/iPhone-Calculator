//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Nicholas Rowe on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
    if (!brain) brain = [[CalculatorBrain alloc] init];
    return brain;
}

- (IBAction)digitPressed: (UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    
    
    if (userIsInTheMiddleOfTypingANumber) {
        [display setText:[[display text] stringByAppendingString:digit]];
    }
    else
    {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
    
}

- (IBAction)deleteDigit
{
    if (userIsInTheMiddleOfTypingANumber)
    {
        NSString * current = display.text;
        NSString * new = [current substringToIndex:[current length] - 1];
        if ([new length] > 0)
        {
            display.text = new;
        }
        else
        {
            userIsInTheMiddleOfTypingANumber = NO;
            display.text = @"0";
        }
        
    }
}

-(IBAction)memoryActionPressed: (UIButton *)sender
{
    NSString *operation = [[sender titleLabel] text];
    if ([@"MS" isEqualToString:operation])
    {
        calculatorMemory = [[display text] doubleValue];
    }
    else if ([@"MR" isEqualToString:operation])
    {
        userIsInTheMiddleOfTypingANumber = NO;
        display.text = [NSString stringWithFormat:@"%g", calculatorMemory];
    }
    else if ([@"MR" isEqualToString:operation])
    {
        calculatorMemory = 0;   
    }
    else if ([@"M+" isEqualToString:operation])
    {
        calculatorMemory = calculatorMemory + [[display text] doubleValue];   
    }
}

- (IBAction)decimalPressed: (UIButton *)sender
{
    if (decimalAlreadyEnteredInDisplay == NO)
    {
        if (userIsInTheMiddleOfTypingANumber == NO)
        {
            userIsInTheMiddleOfTypingANumber = YES;
            [display setText:@"0."];
        }
        else
        {
            [display setText:[[display text] stringByAppendingString:@"."]];
        }
        decimalAlreadyEnteredInDisplay = YES;
    }

}

- (IBAction)clearCalculator
{
    [brain release];
    brain = [[CalculatorBrain alloc] init];
    [display setText:@"0"];
}


- (IBAction)operationPressed: (UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
        decimalAlreadyEnteredInDisplay = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
