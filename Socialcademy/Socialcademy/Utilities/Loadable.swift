//
//  Loadable.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/27/24.
//

import Foundation

enum Loadable<Value> {
    case loading
    case error(Error)
    case loaded(Value)
}

extension Loadable where Value: RangeReplaceableCollection {
    static var empty: Loadable<Value> { .loaded(Value()) }
}