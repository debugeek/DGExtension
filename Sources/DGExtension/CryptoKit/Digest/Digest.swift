//
//  Digest.swift
//  DGExtension
//  
//  Created by Xiao Jin on 2022/7/2.
//  Copyright © 2022 debugeek. All rights reserved.
//

#if canImport(CryptoKit)

import CryptoKit

@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *)
public extension Digest {
    
    var bytes: [UInt8] {
        return Array(makeIterator())
    }
    
}

#endif
