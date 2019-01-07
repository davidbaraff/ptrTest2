//
//  ptrTest2.h
//  ptrTest2
//
//  Created by David Baraff on 1/3/19.
//  Copyright © 2019 Pixar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct CxxData {
    double x, y;
    double m[16];
} CxxData;

double analyze(CxxData const* data);
