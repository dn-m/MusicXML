//
//  PrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct PrintStyleAlign {
    public let printStyle: PrintStyle?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
}

extension PrintStyleAlign: Equatable { }
extension PrintStyleAlign: Codable { }
