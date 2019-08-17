//
//  UIParts.swift
//  ViewGenerator
//
//  Created by funzin on 2019/08/04.
//  Copyright © 2019 funzin. All rights reserved.
//

public enum UIParts: String, CaseIterable {

    case `switch`
    case activityIndicatorView
    case button
    case collectionView
    case control
    case datePicker
    case imageView
    case label
    case navigationBar
    case pageControl
    case pickerView
    case progressView
    case scrollView
    case searchBar
    case segmentedControl
    case slider
    case stackView
    case stepper
    case tabBar
    case tableView
    case textField
    case textView
    case toolbar
    case view
    case visualEffectView
    case none = "_InputTypeName_"

    init(variableName: String) {
        let lowercasedvariableName = variableName.lowercased()
        let target = UIParts.ascendingSorted
            .filter { lowercasedvariableName.contains($0.rawValue.lowercased()) }
            .first

        self = target ?? .none
    }

    /// Sort by character count
    static var ascendingSorted: AllCases {
        return UIParts.allCases.sorted { $0.rawValue.count > $1.rawValue.count }
    }

    /// Add  UI to prefix
    /// - e.g stackView → UIStackView
    var typeName: String {
        switch self {
        case .none: return self.rawValue
        case .`switch`,
             .activityIndicatorView,
             .button,
             .control,
             .collectionView,
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
             .visualEffectView:
            return "UI" + rawValue.prefix(1).uppercased() + rawValue.dropFirst()
        }
    }
}
