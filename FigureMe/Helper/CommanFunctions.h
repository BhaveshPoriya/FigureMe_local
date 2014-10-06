//
//  CommanFunctions.h
//  FigureMe
//
//  Created by ECSMac2 on 10/6/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommanFunctions : NSObject

+(NSMutableURLRequest *)generateAPIRequest:(NSString *)APIUrl reqDist:(NSMutableDictionary* )reqDist;
@end
