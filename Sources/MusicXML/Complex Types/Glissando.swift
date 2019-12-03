//
//  Glissando.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Glissando and slide types both indicate rapidly moving from one pitch to the other so that
/// individual notes are not discerned. The distinction is similar to that between NIFF's glissando
/// and portamento elements. A glissando sounds the half notes in between the slide and defaults to
/// a wavy line. The optional text is printed alongside the line.
public struct Glissando {
    // MARK: - Instance Properties

    public let value: String
    public let type: StartStop
    public let number: Int?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting
    public let printStyle: PrintStyle

    // MARK - Initializers

    public init(_ value: String, type: StartStop, number: Int? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.type = type
        self.number = number
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.printStyle = printStyle
    }
}

extension Glissando: Equatable {}
extension Glissando: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case number
        case lineType
        case dashedFormatting
        case value = ""
    }

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        type = try container.decode(StartStop.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        dashedFormatting = try DashedFormatting(from: decoder)
        printStyle = try PrintStyle(from: decoder)
    }

    // MARK - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(lineType, forKey: .lineType)
        try dashedFormatting.encode(to: encoder)
        try printStyle.encode(to: encoder)
    }
}

import XMLCoder
extension Glissando: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
