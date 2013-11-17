//
//  ElapsedTimeUtil.m
//  DeviceCentral
//
//  Created by Chris Larsen on 11/5/13.
//  Copyright (c) 2013 Oli Griffiths. All rights reserved.
//

#import "ElapsedTimeUtil.h"

@implementation ElapsedTimeUtil

/*
 *  elapsedTimeSince - method to get elapsed time to today
 *  params      :   date (NSDate)
 *  returns     :   elapsed Value (NSString)
 */

- (NSString *)elapsedTimeSince:(NSDate *)date {
    
    NSDate *dateA = date;
    NSDate *dateB = [NSDate date];
    NSMutableArray *stringArray = [[NSMutableArray alloc]init];
    
    //Seperate time using DateComponents
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];
    
    //go through and add items that aren't zero to an array of strings.
    if (components.year != 0)
    {
        NSString *years = [NSString stringWithFormat:@"%i years", components.year];
        [stringArray addObject:years];
    }
    
    if (components.month != 0)
    {
        NSString *months = [NSString stringWithFormat:@"%i months", components.month];
        [stringArray addObject:months];
    }
    
    if (components.day != 0)
    {
        NSString *days = [NSString stringWithFormat:@"%i days", components.day];
        [stringArray addObject:days];
    }
    
    if (components.hour != 0)
    {
        NSString *hours = [NSString stringWithFormat:@"%i hrs", components.hour];
        [stringArray addObject:hours];
    }
    
    if (components.minute != 0)
    {
        NSString *mins = [NSString stringWithFormat:@"%i mins", components.minute];
        [stringArray addObject:mins];
    }
    
    if (components.second != 0)
    {
        NSString *secs = [NSString stringWithFormat:@"%i secs", components.second];
        [stringArray addObject:secs];
    }
    
    
    return  [[stringArray componentsJoinedByString:@", "] stringByAppendingString:@" ago"];;
}

@end
