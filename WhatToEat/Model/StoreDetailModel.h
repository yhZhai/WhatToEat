//
//  StoreDetailModel.h
//  WhatToEat
//
//  Created by 殷子欣 on 2018/3/10.
//  Copyright © 2018年 翟元浩. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import "StoreItemModel.h"
#import "DishModel.h"

@interface StoreDetailModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) StoreItemModel *storeItemModel;
@property (copy, nonatomic) NSArray<DishModel *> *dishModels;
@end
