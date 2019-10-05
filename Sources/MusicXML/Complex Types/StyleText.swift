//
//  StyleText.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The style-text type represents a text element with a print-style attribute group.
public struct StyleText {
    public let value: String
    public let printStyle: PrintStyle?

    public init(value: String, printStyle: PrintStyle? = nil) {
        self.value = value
        self.printStyle = printStyle
    }
}

extension StyleText: Equatable { }
extension StyleText: Codable { }
