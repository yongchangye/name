//
//  TKAddressBook.h
//  获取通讯录
//
//  Created by 叶永长 on 15/3/25.
//  Copyright (c) 2015年 YYC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKAddressBook : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)int recordID;
@property (nonatomic,strong)NSString *tel;
@property (nonatomic,strong)NSString *email;
@end
