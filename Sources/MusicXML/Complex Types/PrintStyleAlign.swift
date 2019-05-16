//
//  PrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct PrintStyleAlign {
    let printStyle: PrintStyle
    let horizontalAlignment: HorizonalAlignment
    let verticalAlignment: VAlign
}

extension PrintStyleAlign: Equatable { }
extension PrintStyleAlign: Decodable { }
