//
//  EmptyPrintObjectStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The empty-print-style-align-object type represents an empty element with print-object and
/// print-style-align attribute groups.
public struct EmptyPrintObjectStyleAlign {
    public let printObject: Bool?
    public let printStyleAlign: PrintStyleAlign?
}

extension EmptyPrintObjectStyleAlign: Equatable { }
extension EmptyPrintObjectStyleAlign: Codable { }
