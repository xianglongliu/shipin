//
//  MKNetWorkState.m
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import "NetWorkState.h"

@implementation NetWorkState

+(int) getNetWorkState
{
    int  netWorkState;
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    
    switch (status)
    {
        case NotReachable:
            netWorkState = NotReachable;
            break;
        case ReachableViaWiFi:
            netWorkState = ReachableViaWiFi;
            break;
        case ReachableViaWWAN:
            netWorkState = ReachableViaWWAN;
            break;
        default:
            netWorkState = 100;
            break;
    }
    return netWorkState;
}



@end
