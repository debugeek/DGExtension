//
//  String.swift
//  DGExtension
//
//  Created by Xiao Jin on 2022/6/24.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public extension String {
    
    subscript(range: CountableClosedRange<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: CountableRange<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> Substring {
        return self[..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> Substring {
        return self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
}

public extension String {

    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard nsRange.location != NSNotFound,
              let start = self.index(self.startIndex, offsetBy: nsRange.location, limitedBy: self.endIndex),
              let end = self.index(start, offsetBy: nsRange.length, limitedBy: self.endIndex) else {
            return nil
        }
        return start..<end
    }

    func substring(with nsRange: NSRange) -> String? {
        guard let range = self.range(from: nsRange) else {
            return nil
        }
        return String(self[range])
    }

}

