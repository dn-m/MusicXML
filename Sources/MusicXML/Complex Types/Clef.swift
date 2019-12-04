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
    // MARK: - Instance Properties

    // MARK: Attributes

    public let number: Int?
    public let additional: Bool?
    public let size: SymbolSize?
    public let afterBarline: Bool?
    public let printObject: Bool?

    // MARK: Elements

    public let sign: ClefSign
    public let line: Int?
    public let clefOctaveChange: Int?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(number: Int? = nil, additional: Bool? = nil, size: SymbolSize? = nil, afterBarline: Bool? = nil, printStyle: PrintStyle = PrintStyle(), printObject: Bool? = nil, sign: ClefSign, line: Int? = nil, clefOctaveChange: Int? = nil) {
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

extension Clef: Equatable {}
extension Clef: Codable {
    // MARK: - Codable

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

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        additional = try container.decodeIfPresent(Bool.self, forKey: .additional)
        size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
        afterBarline = try container.decodeIfPresent(Bool.self, forKey: .afterBarline)
        printStyle = try PrintStyle(from: decoder)
        printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        sign = try container.decode(ClefSign.self, forKey: .sign)
        line = try container.decodeIfPresent(Int.self, forKey: .line)
        clefOctaveChange = try container.decodeIfPresent(Int.self, forKey: .clefOctaveChange)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(YesNo(additional), forKey: .additional)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(YesNo(afterBarline), forKey: .afterBarline)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try container.encode(sign, forKey: .sign)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(clefOctaveChange, forKey: .clefOctaveChange)
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
