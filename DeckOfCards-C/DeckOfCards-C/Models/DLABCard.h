//
//  DLABCard.h
//  DeckOfCards-C
//
//  Created by Nicholas Towery on 12/1/20.
//  Copyright © 2020 DLAB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLABCard : NSObject

@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *image;
@property (nonatomic, readonly) NSString *value;

- (instancetype) initWithSuit: (NSString *)suit
                        image: (NSString *)image
                        value: (NSString *)value;
@end

@interface DLABCard (JSONConvertable)

- (DLABCard *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
