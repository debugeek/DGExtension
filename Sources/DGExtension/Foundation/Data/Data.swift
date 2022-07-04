//  
//  Data.swift
//  DGExtension
//
//  Created by Xiao Jin on 2021/3/22.
//  Copyright © 2021 debugeek. All rights reserved.
//

import Foundation

extension Data {

    var bytes: [UInt8] {
        return [UInt8](self)
    }

}

extension Data {
    
    var hexString: String {
        let hexDigits = Array("0123456789abcdef".utf16)
        var hexChars = [UTF16.CodeUnit]()
        hexChars.reserveCapacity(count*2)

        for byte in self {
            let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
            hexChars.append(hexDigits[index1])
            hexChars.append(hexDigits[index2])
        }

        return String(utf16CodeUnits: hexChars, count: hexChars.count)
    }
    
}
