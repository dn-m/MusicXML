//
//  EmptyPrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct EmptyPrintStyleAlign {
    public let printStyle: PrintStyle?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
}

extension EmptyPrintStyleAlign: Equatable { }
extension EmptyPrintStyleAlign: Codable { }
