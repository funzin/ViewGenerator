//
//  AccessModifierTests.swift
//  ViewGeneratorTests
//
//  Created by funzin on 2019/08/11.
//  Copyright © 2019 funzin. All rights reserved.
//

import XCTest

class AccessModifierTests: XCTestCase {


    func testBegginingOfVariable() {
        let accessModifierTextArray = ["private", "fileprivate", "internal"]
        let begginingOfVariableArray = ["private ", "fileprivate ", ""]

        for (accessModifierText, begginingOfVariable) in zip(accessModifierTextArray, begginingOfVariableArray) {
            guard let accessModifier = AccessModifier(rawValue: accessModifierText) else {
                XCTFail("accessModifier should not be nil. accessModifierText is \(accessModifierText)")
                return
            }
            XCTAssertEqual(accessModifier.beginningOfVariable, begginingOfVariable)
        }
    }
}
