//  
//  Data+Crypto.swift
//  DGExtension
//
//  Created by Xiao Jin on 2021/3/22.
//  Copyright © 2021 debugeek. All rights reserved.
//

import Foundation
import CommonCrypto

#if canImport(CryptoKit)
import CryptoKit
#endif

public extension Data {

    var MD5Data: Data {
#if canImport(CryptoKit)
        if #available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *) {
            let bytes = Insecure.MD5.hash(data: self).bytes
            return Data(bytes)
        } else {
            var bytes = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            withUnsafeBytes { buffer in
                _ = CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &bytes)
            }
            return Data(bytes)
        }
#else
        var bytes = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        withUnsafeBytes { buffer in
            _ = CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &bytes)
        }
        return Data(bytes)
#endif
    }
    
    var MD5String: String {
        return MD5Data.hexString
    }

}
