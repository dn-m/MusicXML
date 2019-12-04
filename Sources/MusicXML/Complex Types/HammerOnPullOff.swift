//
//  HammerOnPullOff.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hammer-on and pull-off elements are used in guitar and fretted instrument notation. Since a
/// single slur can be marked over many notes, the hammer-on and pull-off elements are separate so
/// the individual pair of notes can be specified. The element content can be used to specify how
/// the hammer-on or pull-off should be notated. An empty element leaves this choice up to the
/// application.
public struct HammerOnPullOff {
    // MARK: - Instance Properties

    public let value: String
    public let type: StartStop
    public let number: Int?
    public let printStyle: PrintStyle
    public let placement: AboveBelow?

    // MARK: - Initializers

    public init(_ value: String, type: StartStop, number: Int? = nil, printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.value = value
        self.type = type
        self.number = number
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension HammerOnPullOff: Equatable {}
extension HammerOnPullOff: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case number
        case placement
        case value = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        type = try container.decode(StartStop.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }
}

import XMLCoder
extension HammerOnPullOff: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
