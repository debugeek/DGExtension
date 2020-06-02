//  
//  UnsafeMutablePointer.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/6/2.
//  Copyright © 2020 debugeek. All rights reserved.
//

public extension UnsafeMutablePointer {
    
    var raw: UnsafeMutableRawPointer {
        return UnsafeMutableRawPointer(self)
    }
    
    func buffer(n: Int) -> UnsafeMutableBufferPointer<Pointee> {
        return UnsafeMutableBufferPointer(start: self, count: n)
    }
    
    func advanced(by n: Int, wordSize: Int) -> UnsafeMutableRawPointer {
        return self.raw.advanced(by: n*wordSize)
    }
    
}
