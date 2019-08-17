//
//  UserDefaults+Extension.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/05.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

extension UserDefaults {
    public enum KeyList {
        public static let accessModifier = Key<String>(name: "accessModifier")
    }
}

extension UserDefaults {
    public static let group: UserDefaults! = UserDefaults(suiteName: "E5RDJ83DDA.com.funzin.ViewGeneratorApp")

    public func set<ValueType>(_ value: ValueType, forKey key: Key<ValueType>) {
        set(value, forKey: key.name)
    }

    public func get<ValueType>(forKey key: Key<ValueType>) -> ValueType? {
        return value(forKey: key.name) as? ValueType
    }

    public func removeAll() {
        let dictionary = dictionaryRepresentation()
        dictionary.keys.forEach { key in removeObject(forKey: key) }
    }
}

public struct Key<ValueType> {
    let name: String

    init(name: String) {
        self.name = name
    }
}
