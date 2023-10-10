//
//  Collection.swift
//  DGExtension
//
//  Created by Xiao Jin on 2023/10/09.
//  Copyright © 2023 debugeek. All rights reserved.
//

extension BidirectionalCollection where Iterator.Element: Equatable {

    typealias Element = Self.Iterator.Element

    func next(of item: Element) -> Element? {
        guard let index = self.firstIndex(of: item),
              self.distance(from: index, to: self.endIndex) > 1 else {
            return nil
        }
        return self[self.index(after: index)]
    }

    func previous(of item: Element) -> Element? {
        guard let index = self.firstIndex(of: item),
              self.distance(from: self.startIndex, to: index) > 0 else {
            return nil
        }
        return self[self.index(before: index)]
    }

}

