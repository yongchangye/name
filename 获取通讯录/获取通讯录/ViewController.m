//
//  ViewController.m
//  获取通讯录
//
//  Created by 叶永长 on 15/3/25.
//  Copyright (c) 2015年 YYC. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import <Foundation/Foundation.h>
#import "TKAddressBook.h"
@interface ViewController ()
{
    NSDictionary *dic;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    ABAddressBookRef addressBook = nil;
    addressBook = ABAddressBookCreateWithOptions(nil, nil);
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    CFArrayRef allpeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    NSLog(@"%ld",nPeople);
    for (NSInteger i = 0; i<nPeople; i++) {
        ABRecordRef person = CFArrayGetValueAtIndex(allpeople, i);
        
        CFTypeRef abName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString *stringName = (__bridge NSString *)(abName);
        NSLog(@"firstName%@\n",stringName);
        
        CFTypeRef abLastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        NSString *lastName = (__bridge NSString *)(abLastName);
        NSLog(@"lastName%@\n",lastName);
        
        CFTypeRef abFullName = ABRecordCopyCompositeName(person);
        NSString *fullName = (__bridge NSString *)(abFullName);
        NSLog(@"fullName%@",fullName);
        
        TKAddressBook *address = [[TKAddressBook alloc]init];
        address.name = stringName;
        address.recordID = (int)ABRecordGetRecordID(person);
        ABPropertyID multiproperties[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        NSInteger multipropertiesTotal = sizeof(multiproperties)/sizeof(ABPropertyID);
        for (NSInteger j = 0; j<multipropertiesTotal; j++) {
            ABPropertyID property = multiproperties[j];
            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
            NSInteger valueCount = 0;
            if (valuesRef != nil) {
                valueCount = ABMultiValueGetCount(valuesRef);
            }
            if (valueCount == 0) {
                CFRelease(valuesRef);
                continue;
            }
            for (NSInteger k = 0; k<valueCount; k++) {
                CFTypeRef value = ABMultiValueCopyValueAtIndex(valuesRef, k);
                switch (j) {
                    case 0:{
                        address.tel = (__bridge NSString *)(value);
                        break;
                    }
                    case 1:{
                        address.email = (__bridge NSString *)(value);
                        break;
                    }
                    default:
                        break;
                }
            }
            NSLog(@"addressbook%@\n%@",address.email,address.tel);
        }
        
        NSLog(@"……………………");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
