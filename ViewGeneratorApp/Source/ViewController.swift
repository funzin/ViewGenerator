//
//  ViewController.swift
//  ViewGeneratorApp
//
//  Created by funzin on 2019/08/04.
//  Copyright © 2019 funzin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var privateRadioButton: NSButton!
    @IBOutlet var fileprivateRadioButton: NSButton!
    @IBOutlet var internalRadioButton: NSButton!
    @IBOutlet var publicRadioButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI() {
        guard let text = UserDefaults.group.get(forKey: UserDefaults.KeyList.accessModifier),
            let accessModifier = AccessModifier(rawValue: text) else { return }

        switch accessModifier {
        case .private:
            privateRadioButton.state = .on
        case .fileprivate:
            fileprivateRadioButton.state = .on
        case .internal:
            internalRadioButton.state = .on
        case .public:
            publicRadioButton.state = .on
        }
    }

    @IBAction func didTapRadioButton(_ sender: NSButton) {
        UserDefaults.group.set(sender.title, forKey: UserDefaults.KeyList.accessModifier)
    }
}
