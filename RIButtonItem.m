//
//  RIButtonItem.m
//  Shibui
//
//  Created by Jiva DeVoe on 1/12/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "RIButtonItem.h"

@implementation RIButtonItem

@synthesize label;
@synthesize action;

+(id)item
{
    id result = [self new];
#if !__has_feature(objc_arc)
    [result autorelease];
#endif
    return result;
}

+(id)itemWithLabel:(NSString *)inLabel
{
    id newItem = [self item];
    [newItem setLabel:inLabel];
    return newItem;
}

+(id)itemWithLabel:(NSString *)label andAction:(void(^)())action
{
    RIButtonItem *newItem = (RIButtonItem *)[self item];
    newItem.label = label;
    newItem.action = action;
    return newItem;
}

- (id)initWithLabel:(NSString *)label {
    return [self initWithLabel:nil andAction:nil];
}

- (id)initWithLabel:(NSString *)_label andAction:(void(^)())_action
{
    self = [super init];
    if (self) {
        self.label  = label;
        self.action = action;
    }
    return self;
}

-(void)dealloc {
    self.action = nil;
    self.label = nil;
    [super dealloc];
}

@end

