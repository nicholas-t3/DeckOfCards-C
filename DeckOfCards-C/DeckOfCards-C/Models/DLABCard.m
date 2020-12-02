//
//  DLABCard.m
//  DeckOfCards-C
//
//  Created by Nicholas Towery on 12/1/20.
//  Copyright © 2020 DLAB. All rights reserved.
//

#import "DLABCard.h"

NSString *suitKey = @"suit";
NSString *imageKey = @"image";
NSString *valueKey = @"value";

@implementation DLABCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image value:(NSString *)value
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _image = image;
        _value = value;
    }
    return self;
}

- (DLABCard *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[suitKey];
    NSString *image = dictionary[imageKey];
    NSString *value = dictionary[valueKey];
    
   return [self initWithSuit:suit image:image value:value];
    
}

@end
