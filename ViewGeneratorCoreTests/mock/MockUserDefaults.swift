//
//  MockUserDefaults.swift
//  ViewGeneratorCoreTests
//
//  Created by funzin on 2019/09/14.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

@testable import ViewGeneratorCore
class MockUserDefaults: UserDefaultsProtocol {
    private var dict: [String: Any] = [:]

    func set<ValueType>(_ value: ValueType, forKey key: UserDefaults.Key<ValueType>) {
        dict[key.name] = value
    }

    func get<ValueType>(forKey key: UserDefaults.Key<ValueType>) -> ValueType? {
        return dict[key.name] as? ValueType
    }

    func removeAll() {
        dict.removeAll()
    }
}
