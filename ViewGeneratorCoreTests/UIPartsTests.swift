//
//  UIPartsTests.swift
//  ViewGeneratorTests
//
//  Created by funzin on 2019/08/04.
//  Copyright © 2019 funzin. All rights reserved.
//

import XCTest

@testable import ViewGeneratorCore
class UIPartsTests: XCTestCase {

    var variableNameArray: [String]!

    override func setUp() {
        variableNameArray = ["hogeImageView", "hogeTableView", "hogeCollectionView", "hogeView", "hoge"]
    }

    func testAscendingSorted() {
        let sortedAllCases = UIParts.ascendingSorted
        let first = sortedAllCases.first?.rawValue
        let last = sortedAllCases.last?.rawValue

        if let first = first,
            let last = last {
            XCTAssertGreaterThan(first.count, last.count)
        } else {
            XCTFail("first and last should not be nil")
        }
    }

    func testInitWithvariableName() {
        let typeArray: [UIParts] = [.imageView, .tableView, .collectionView, .view, .none]

        for (variableName, type) in zip(variableNameArray, typeArray) {
            let uiParts = UIParts(variableName: variableName)
            XCTAssertEqual(uiParts, type)
        }
    }

    func testInitWithvariableNameWhenLowerCase() {
        variableNameArray = ["hogeimageview", "hogetableview", "hogecollectionview", "hogeview", "hoge", "hogeButtonContainerView"]
        let uiPartsArray: [UIParts] = [.imageView, .tableView, .collectionView, .view, .none, .view]

        for (variableName, type) in zip(variableNameArray, uiPartsArray) {
            let uiParts = UIParts(variableName: variableName)
            XCTAssertEqual(uiParts, type)
        }
    }

    func testTypeName() {
        let typeNameArray: [String] = ["UIImageView", "UITableView", "UICollectionView", "UIView", "_InputTypeName_"]

        for (variableName, typeName) in zip(variableNameArray, typeNameArray) {
            let uiParts = UIParts(variableName: variableName)
            XCTAssertEqual(uiParts.typeName, typeName)
        }
    }

}
