//
//  ViewInitGeneratorTests.swift
//  ViewGeneratorTests
//
//  Created by funzin on 2019/08/11.
//  Copyright © 2019 funzin. All rights reserved.
//

import XCTest

@testable import ViewGeneratorCore
class ViewInitGeneratorTests: XCTestCase {
    var viewInitGenerator: ViewInitGenerator!

    override func setUp() {
        viewInitGenerator = ViewInitGenerator.shared
        UserDefaults.group.removeAll()
    }

    func testGenerate() {
        let variableNameArray = ["hogeCollectionView", "hogeView", "hoge"]
        let initClosureTextArray = [
            """
            private let hogeCollectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                let hogeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                hogeCollectionView.translatesAutoresizingMaskIntoConstraints = false
                return hogeCollectionView
            }()
            \n
            """,
            """
            private let hogeView: UIView = {
                let hogeView = UIView(frame: .zero)
                hogeView.translatesAutoresizingMaskIntoConstraints = false
                return hogeView
            }()
            \n
            """,
            """
            private let hoge: _InputTypeName_ = {
                let hoge = _InputTypeName_(frame: .zero)
                hoge.translatesAutoresizingMaskIntoConstraints = false
                return hoge
            }()
            \n
            """
        ]

        for (variableName, initClosureText) in zip(variableNameArray, initClosureTextArray) {
            XCTAssertEqual(viewInitGenerator.generate(startPosition: 0, variableName: variableName), initClosureText)
        }
    }

    func testGenerateWhenHaveIndent() {
        let startPosition = 2
        let variableName = "hogeView"

        let initClosureText =
            """
              private let hogeView: UIView = {
                  let hogeView = UIView(frame: .zero)
                  hogeView.translatesAutoresizingMaskIntoConstraints = false
                  return hogeView
              }()
            \n
            """

        XCTAssertEqual(viewInitGenerator.generate(startPosition: startPosition, variableName: variableName), initClosureText)
    }

    func testGenerateWhenSelectedAccessModifier() {
        let variableName = "hogeView"
        let selectedAccessModifier = "internal"
        let initClosureText =
            """
            let hogeView: UIView = {
                let hogeView = UIView(frame: .zero)
                hogeView.translatesAutoresizingMaskIntoConstraints = false
                return hogeView
            }()
            \n
            """

        UserDefaults.group.set(selectedAccessModifier, forKey: UserDefaults.KeyList.accessModifier)
        XCTAssertEqual(viewInitGenerator.generate(startPosition: 0, variableName: variableName), initClosureText)
    }

    func testVariableStartPositionAndName() {
        let lines = ["hogeLabel", " hogeButton", "  hogeView", " hogeLabel "]
        let results = [(0, "hogeLabel"), (1, "hogeButton"), (2, "hogeView"), (1, "hogeLabel")]

        for (line, result) in zip(lines, results) {
            let tuple = viewInitGenerator.variableStartPositionAndName(lineStr: line)
            let startPosition = tuple?.0
            let variableName = tuple?.1
            XCTAssertEqual(startPosition, result.0)
            XCTAssertEqual(variableName, result.1)
        }
    }

    func testGenerateInitArray() {
        let selectedLinesArray = [[], ["hogeView"], ["  hogeView", "  hogeButton"]]
        let initArray = [
            "",
            """
            private let hogeView: UIView = {
                let hogeView = UIView(frame: .zero)
                hogeView.translatesAutoresizingMaskIntoConstraints = false
                return hogeView
            }()
            \n
            """,
            """
              private let hogeView: UIView = {
                  let hogeView = UIView(frame: .zero)
                  hogeView.translatesAutoresizingMaskIntoConstraints = false
                  return hogeView
              }()

              private let hogeButton: UIButton = {
                  let hogeButton = UIButton(frame: .zero)
                  hogeButton.translatesAutoresizingMaskIntoConstraints = false
                  return hogeButton
              }()
            \n
            """
        ]

        for (selectedLines, initText) in zip(selectedLinesArray, initArray) {
            let result = viewInitGenerator.generateInitArray(selectedLines: selectedLines)
            XCTAssertEqual(initText, result.joined())
        }
    }
}
