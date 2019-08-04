//
//  SourceEditorCommand.swift
//  ViewGenerator
//
//  Created by funzin on 2019/08/04.
//  Copyright © 2019 funzin. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    private enum Const {
        static let domain = "ViewGenerator"
    }

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let textBuffer = invocation.buffer
        let lines = textBuffer.lines
        let selections = textBuffer.selections

        // extract selected line
        guard let selection = selections.firstObject as? XCSourceTextRange,
            let variableName = selectedText(lines: lines, selection: selection) else {
                completionHandler(NSError(domain: Const.domain, code: 401, userInfo: ["reason": "text is not selected"]))
                return
        }

        let initText = ViewInitCreator.shared.create(indentStart: selection.start.column, variableName: variableName)

        // replace
        let line = selection.end.line
        lines.remove(lines[line])
        lines.insert(initText, at: line)

        completionHandler(nil)
    }
}

extension SourceEditorCommand {

    /// Extract selected text
    private func selectedText(lines: NSMutableArray, selection: XCSourceTextRange) -> String? {
        let start = selection.start.column
        let end = selection.end.column
        
        guard start != end,
            let line = lines[selection.end.line] as? String else { return nil }
        
        let startIndex = line.index(line.startIndex, offsetBy: start)
        let endIndex = line.index(line.startIndex, offsetBy: end)
        let selectedText = String(line[startIndex..<endIndex])
        return selectedText
    }
}
