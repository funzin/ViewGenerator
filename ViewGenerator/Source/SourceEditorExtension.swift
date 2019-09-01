//
//  SourceEditorExtension.swift
//  ViewGenerator
//
//  Created by funzin on 2019/08/04.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {

    func extensionDidFinishLaunching() {
        // If your extension needs to do any work at launch, implement this optional method.
    }

    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
}
