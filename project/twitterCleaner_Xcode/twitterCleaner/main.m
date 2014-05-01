//
//  main.m
//  twitterCleaner
//
//  Created by Jerome Morissard on 5/1/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STTwitterAPI.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        NSLog(@"This command line has been made to purge your friends list (1000 by 1000, relaunch if necessary) !");
        STTwitterAPI *twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            NSLog(@"ok block, %@",twitter);
            
            [twitter getFriendsIDsForUserID:nil orScreenName:twitter.userName cursor:@"-1" count:@"1000" successBlock:^(NSArray *ids, NSString *previousCursor, NSString *nextCursor) {
                NSLog(@"ok block, %@",twitter);
                
                for (NSString *userId in ids) {
                    /*[twitter postFriendshipsDestroyScreenName:nil orUserID:userId successBlock:^(NSDictionary *unfollowedUser) {
                        NSLog(@"unfollowed UserId %@ ",userId);

                    } errorBlock:^(NSError *error) {
                        NSLog(@"errorBlock %@",error);
                    }];
                     */
                    NSLog(@"unfollowed UserId %@ ",userId);

                }

            } errorBlock:^(NSError *error) {
                NSLog(@"errorBlock %@",error);
            }];
         
        } errorBlock:^(NSError *error) {
            NSLog(@"errorBlock %@",error);
        }];
        
        [[NSRunLoop currentRunLoop] run];
    }
    
    return 0;
}
