//
//  ExUINavigationController.m
//  livenews
//
//  Created by dust on 14-11-7.
//
//

#import "ExUINavigationController.h"
#import "ViewController.h"

@interface ExUINavigationController ()

@end

@implementation ExUINavigationController

- (NSUInteger)supportedInterfaceOrientations
{
    
    NSArray *arr = self.viewControllers;
    if ([arr count] == 0)
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    id vc = [arr objectAtIndex:0];
    
    if ([vc isKindOfClass:[ViewController class]])
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    else
    {
        return UIInterfaceOrientationMaskAll;
    }
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
