//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Nicholas Rowe on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void)setOperand:(double)aDouble
{
    operand = aDouble;
}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqualToString:@"sqrt"])
    {
        operand = sqrt(operand);
    }
    else if ([operation isEqualToString:@"+/-"] && operand != 0)
    {
        operand = -1 * operand;
    }
    else if ([operation isEqualToString:@"1/x"] && operand != 0)
    {
        operand = 1.0 / operand;
    }

    else if ([operation isEqualToString:@"sin"])
    {
        operand = sin(operand);
    }
    else if ([operation isEqualToString:@"cos"])
    {
        operand = cos(operand);
    }
    else if ([operation isEqualToString:@"tan"])
    {
        operand = tan(operand);
    }
    else
    {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    
    return operand;
}

- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    else if ([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if ([@"/" isEqual:waitingOperation])
    {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

@end
