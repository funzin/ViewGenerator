//
//  UserDefaults+Extension.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/05.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum KeyList {
        static let accessModifier = Key<String>(name: "accessModifier")
    }
}

extension UserDefaults {
    static let group: UserDefaults! = UserDefaults(suiteName: "E5RDJ83DDA.com.funzin.ViewGeneratorApp")

    func set<ValueType>(_ value: ValueType, forKey key: Key<ValueType>) {
        set(value, forKey: key.name)
    }

    func get<ValueType>(forKey key: Key<ValueType>) -> ValueType? {
        return value(forKey: key.name) as? ValueType
    }

    func removeAll() {
        let dictionary = dictionaryRepresentation()
        dictionary.keys.forEach { key in removeObject(forKey: key) }
    }
}

struct Key<ValueType> {
    let name: String

    init(name: String) {
        self.name = name
    }
}
