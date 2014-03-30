//
//  main.m
//  blockTest
//
//  Created by Misaka on 14-3-26.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    return 0;
}

