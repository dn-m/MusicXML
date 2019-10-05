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

    public let number: Int?
    public let additional: Bool?
    public let size: SymbolSize?
    public let afterBarline: Bool?
    public let printStyle: PrintStyle?
    public let printObject: Bool?

    // MARK: - Elements

    public let sign: ClefSign
    public let line: Int?
    public let clefOctaveChange: Int?

    public init(number: Int? = nil, additional: Bool? = nil, size: SymbolSize? = nil, afterBarline: Bool? = nil, printStyle: PrintStyle? = nil, printObject: Bool? = nil, sign: ClefSign, line: Int? = nil, clefOctaveChange: Int? = nil) {
        self.number = number
        self.additional = additional
        self.size = size
        self.afterBarline = afterBarline
        self.printStyle = printStyle
        self.printObject = printObject
        self.sign = sign
        self.line = line
        self.clefOctaveChange = clefOctaveChange
    }
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
