//
//  InitClosureCreator.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/11.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation

/// Name space to generate initializer closure text for view
public struct ViewInitGenerator {

    public static let shared = ViewInitGenerator()

    /// Generate view init array
    /// - Parameter selectedLines: selected lines
    public func generateViewInitArray(selectedLines: [String]) -> [String] {
        var viewInitArray: [String] = []

        for selectedLine in selectedLines {
            guard let (startPosition, variableName) = variableStartPositionAndName(lineStr: selectedLine) else {
                return []
            }

            let initText = ViewInitGenerator.shared.generate(startPosition: startPosition, variableName: variableName)
            viewInitArray.append(initText)
        }
        return viewInitArray
    }
}

/// MARK: internal method
extension ViewInitGenerator {

    /// Generate initializer closure text for view
    /// - Parameter startPosition: variable name start position
    /// - Parameter variableName: variable name(e.g: hogeView, hogeLabel)
    func generate(startPosition: Int, variableName: String) -> String {
        let uiParts = UIParts(variableName: variableName)
        let space = String(repeating: " ", count: startPosition)
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

    /// Return variable start position and variale name
    /// - Parameter lineStr: line string
    func variableStartPositionAndName(lineStr: String) -> (Int, String)? {
        guard let regex = try? NSRegularExpression(pattern: "^(\\s*)(\\S+)"),
            let matched = regex.firstMatch(in: lineStr, range: NSRange(location: 0, length: lineStr.count)),
            matched.numberOfRanges == 3 else { return nil }

        let nsLineStr = (lineStr as NSString)
        let spaceStr = nsLineStr.substring(with: matched.range(at: 1))
        let variableName = nsLineStr.substring(with: matched.range(at: 2))

        return(spaceStr.count, variableName)
    }
}

/// MARK: private method
extension ViewInitGenerator {

    /// Generate view init
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
