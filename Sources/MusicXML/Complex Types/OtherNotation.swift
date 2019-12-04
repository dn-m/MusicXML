//
//  OtherNotation.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The other-notation type is used to define any notations not yet in the MusicXML format. This
/// allows extended representation, though without application interoperability. It handles
/// notations where more specific extension elements such as other-dynamics and other-technical are
/// not appropriate.
public struct OtherNotation {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopSingle
    public let number: Int?
    public let printObject: Bool?
    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Value

    public let value: String

    // MARK: - Initializers

    public init(_ value: String, type: StartStopSingle, number: Int? = nil, printObject: Bool? = nil, printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.value = value
        self.type = type
        self.number = number
        self.printObject = printObject
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension OtherNotation: Equatable {}
extension OtherNotation: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case number
        case printObject
        case placement
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        type = try container.decode(StartStopSingle.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }
}

import XMLCoder
extension OtherNotation: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
