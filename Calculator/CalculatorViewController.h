//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Nicholas Rowe on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    double calculatorMemory;
    BOOL userIsInTheMiddleOfTypingANumber;
    BOOL decimalAlreadyEnteredInDisplay;
}

- (IBAction)digitPressed: (UIButton *)sender;
- (IBAction)operationPressed: (UIButton *)sender;
- (IBAction)decimalPressed: (UIButton *)sender;
- (IBAction)clearCalculator;
- (IBAction)deleteDigit;

-(IBAction)memoryActionPressed: (UIButton *)sender;

@end
