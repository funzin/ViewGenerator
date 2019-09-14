//
//  UserDefaultsProtocol.swift
//  ViewGeneratorCore
//
//  Created by funzin on 2019/09/14.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

public protocol UserDefaultsProtocol {
    func set<ValueType>(_ value: ValueType, forKey key: UserDefaults.Key<ValueType>)
    func get<ValueType>(forKey key: UserDefaults.Key<ValueType>) -> ValueType?
    func removeAll()
}
