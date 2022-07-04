//
//  String.swift
//  DGExtension
//
//  Created by Xiao Jin on 2022/6/24.
//  Copyright © 2022 debugeek. All rights reserved.
//

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
