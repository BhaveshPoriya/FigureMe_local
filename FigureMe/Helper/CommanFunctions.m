//
//  CommanFunctions.m
//  FigureMe
//
//  Created by ECSMac2 on 10/6/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import "CommanFunctions.h"

@implementation CommanFunctions

+(NSMutableURLRequest *)generateAPIRequest:(NSString *)APIUrl reqDist:(NSMutableDictionary* )reqDist{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:reqDist
                                                       options:0
                                                         error:&error];
    NSString *jsonString;
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSURL *url = [NSURL URLWithString:APIUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSData *requestData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    return request;
}
+(NSMutableURLRequest *)getLogInRequest:(NSString *)Username Password:(NSString* )Password{
    
    NSMutableDictionary *reqDist = [[NSMutableDictionary alloc] init];
    [reqDist setObject:@"login" forKey:@"action"];
    [reqDist setObject:Username forKey:@"username"];
    [reqDist setObject:Password forKey:@"password"];

    NSString *_URL =[NSString stringWithFormat:@"%@/login", @APIRootURL];
    
    return [self generateAPIRequest:_URL reqDist:reqDist];
}

@end
