//
//  AccessModifier.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/05.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

enum AccessModifier: String, CaseIterable {
    case `private`
    case `fileprivate`
    case `internal`
    case `public`
}

extension AccessModifier {
    var beginningOfVariable: String {
        switch self {
        case .internal:
            return ""
        case .private, .fileprivate, .public:
            return self.rawValue + " "
        }
    }
}
