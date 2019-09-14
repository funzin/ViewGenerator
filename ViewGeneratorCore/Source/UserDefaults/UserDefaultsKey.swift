//
//  UserDefaultsKey.swift
//  ViewGeneratorCore
//
//  Created by funzin on 2019/09/14.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

extension UserDefaults {

    public struct Key<ValueType> {
        let name: String

        init(name: String) {
            self.name = name
        }
    }

    public enum KeyList {
        public static let accessModifier = Key<String>(name: "accessModifier")
    }
}
