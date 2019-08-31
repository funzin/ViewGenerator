//
//  ViewInitCreatorTests.swift
//  ViewGeneratorTests
//
//  Created by funzin on 2019/08/11.
//  Copyright © 2019 funzin. All rights reserved.
//

import XCTest

@testable import ViewGeneratorCore
class ViewInitCreatorTests: XCTestCase {
    var viewInitCreator: ViewInitCreator!

    override func setUp() {
        viewInitCreator = ViewInitCreator.shared
        UserDefaults.group.removeAll()
    }

    func testCreate() {
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
            XCTAssertEqual(viewInitCreator.create(indentStart: 0, variableName: variableName), initClosureText)
        }
    }

    func testCreatetWhenHaveIndent() {
        let startIndent = 2
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

        XCTAssertEqual(viewInitCreator.create(indentStart: startIndent, variableName: variableName), initClosureText)
    }

    func testCreateWhenSelectedAccessModifier() {
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
        XCTAssertEqual(viewInitCreator.create(indentStart: 0, variableName: variableName), initClosureText)
    }

    func test_generateViewInitArray() {
        let selectedLinesArray = [[], ["hogeView "], ["hogeView ", "hogButton"], ["hogeView"], ["  hogeView", "  hogeButton"]]
        let initArray = [
            "",
            "",
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
            let result = viewInitCreator.generateViewInitArray(selectedLines: selectedLines)
            XCTAssertEqual(initText, result.joined())
        }
    }
}
