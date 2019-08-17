//
//  InitClosureCreator.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/11.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

/// Name space to create initializer closure text for view
public struct ViewInitCreator {
    
    public static let shared = ViewInitCreator()

    /// Create initializer closure text for view
    /// - Parameter indentStart: start indent position
    /// - Parameter variableName: variable name(e.g: hogeView, hogeLabel)
    public func create(indentStart: Int, variableName: String) -> String {
        let uiParts = UIParts(variableName: variableName)
        let space = String(repeating: " ", count: indentStart)
        let initArray = initTextArray(variableName: variableName, uiParts: uiParts)


        // read selected accessModifier on app
        let accessModifier: AccessModifier
        if let text = UserDefaults.group.get(forKey: UserDefaults.KeyList.accessModifier),
            let _accessModifier = AccessModifier(rawValue: text) {
            accessModifier = _accessModifier
        } else {
            accessModifier = .private
        }

        var initClosureTextArray = [
            "\(accessModifier.beginningOfVariable)let \(variableName): \(uiParts.typeName) = {",
            // insert initArray position
            "    \(variableName).translatesAutoresizingMaskIntoConstraints = false",
            "    return \(variableName)",
            "}()\n"
            ]

        // insert
        initArray.reversed().forEach { initClosureTextArray.insert($0, at: 1) }

        // add space and new line
        let initClosureText = initClosureTextArray
            .map { "\(space)\($0)\n" }
            .joined()
        return initClosureText
    }

    /// Create view init
    /// - Parameter variableName: variable name(e.g: hogeView, hogeLabel)
    /// - Parameter uiParts: UIParts contains type information
    private func initTextArray(variableName: String, uiParts: UIParts) -> [String] {
        switch uiParts {
        case .collectionView:

            // add UICollectionViewFlowLayout when only collectionView
            return ["    let layout = UICollectionViewFlowLayout()",
                    "    let \(variableName) = \(uiParts.typeName)(frame: .zero, collectionViewLayout: layout)"]
        case .`switch`,
             .activityIndicatorView,
             .button,
             .control,
             .datePicker,
             .imageView,
             .label,
             .navigationBar,
             .pageControl,
             .pickerView,
             .progressView,
             .scrollView,
             .searchBar,
             .segmentedControl,
             .slider,
             .stackView,
             .stepper,
             .tabBar,
             .tableView,
             .textField,
             .textView,
             .toolbar,
             .view,
             .visualEffectView,
             .none:
            return ["    let \(variableName) = \(uiParts.typeName)(frame: .zero)"]
        }
    }
}
