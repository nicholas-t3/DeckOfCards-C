//
//  DLABCardController.m
//  DeckOfCards-C
//
//  Created by Nicholas Towery on 12/1/20.
//  Copyright © 2020 DLAB. All rights reserved.
//

#import "DLABCardController.h"
#import "DLABCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/";
NSString *countQueryItem = @"count";

@implementation DLABCardController

+ (DLABCardController *)sharedInstance {
    static DLABCardController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DLABCardController new];
    });
    return sharedInstance;
}

+ (void)drawANewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<DLABCard *> * _Nullable))completion
{
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURLComponents *components = [NSURLComponents componentsWithString: baseURLString];
    NSURLQueryItem *cardQuery = [NSURLQueryItem queryItemWithName:countQueryItem value:cardCount];
    components.queryItems = @[cardQuery];
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        
        NSDictionary *jsonDictionaries = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&error];
        NSArray *cardsArray = jsonDictionaries[@"cards"];
        
        NSMutableArray *cardsPlaceholder = [[NSMutableArray alloc] init];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            DLABCard *card = [[DLABCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceholder addObject:card];
        }
        completion(cardsPlaceholder);
    } ] resume ];
}

+ (void)fetchCardImage:(DLABCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString: card.image];
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error);
            return completion(nil);
        }
        
        if (!data){
            NSLog(@"No data was found");
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    } ] resume ];
}

@end
