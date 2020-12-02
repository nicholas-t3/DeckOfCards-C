//
//  DLABCardController.h
//  DeckOfCards-C
//
//  Created by Nicholas Towery on 12/1/20.
//  Copyright © 2020 DLAB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLABCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLABCardController : NSObject

+(void)drawANewCard:(NSInteger)numberOfCards completion:(void(^) (NSArray<DLABCard *> *_Nullable cards))completion;

+(void)fetchCardImage:(DLABCard *)card completion:(void(^)(UIImage *))completion;

+(instancetype) sharedInstance;
@end

NS_ASSUME_NONNULL_END
