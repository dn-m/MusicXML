//
//  Clef.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// Clefs are represented by a combination of sign, line, and clef-octave-change elements. Clefs
/// appear at the start of each system unless the print-object attribute has been set to "no" or the
/// additional attribute has been set to "yes".
public struct Clef {

    // MARK: - Attributes

    public var number: Int?
    public var additional: Bool?
    public var size: SymbolSize?
    public var afterBarline: Bool?
    public var printStyle: PrintStyle?
    public var printObject: Bool?

    // MARK: - Elements

    public var sign: ClefSign
    public var line: Int?
    public var clefOctaveChange: Int?
}

extension Clef: Equatable { }
extension Clef: Codable {
    enum CodingKeys: String, CodingKey {
        case number
        case additional
        case size
        case afterBarline = "after-barline"
        case printStyle
        case printObject
        case sign
        case line
        case clefOctaveChange = "clef-octave-change"
    }
}

extension Clef: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.number, CodingKeys.additional, CodingKeys.size, CodingKeys.afterBarline:
            return .attribute
        default:
            return .element
        }
    }
}

extension Clef: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.number, CodingKeys.additional, CodingKeys.size, CodingKeys.afterBarline:
            return .attribute
        default:
            return .element
        }
    }
}
