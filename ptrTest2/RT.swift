//
//  RT.swift
//  ptrTest2
//
//  Created by David Baraff on 1/3/19.
//  Copyright © 2019 Pixar. All rights reserved.
//

import Foundation

public struct RT {
    public init() {
        data = CxxData(x: 0, y: 0,
                       m: (0, 0, 0, 0,
                           0, 0, 0, 0,
                           0, 0, 0, 0,
                           0, 0, 0, 0))
    }
   
    public func call_that_copies() -> Double {
        var data_copy = data
        return analyze(&data_copy)
    }

    public mutating func mutating_call_that_copies() -> Double {
        var data_copy = data
        return analyze(&data_copy)
    }

    var data: CxxData
}
