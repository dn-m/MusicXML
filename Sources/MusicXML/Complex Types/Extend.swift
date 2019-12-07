//
//  Extend.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The extend type represents lyric word extension / melisma lines as well as figured bass
/// extensions. The optional type and position attributes are added in Version 3.0 to provide better
/// formatting control.
public struct Extend {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopContinue?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(type: StartStopContinue? = nil, printStyle: PrintStyle = PrintStyle()) {
        self.type = type
        self.printStyle = printStyle
    }
}

extension Extend: Equatable {}
extension Extend: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(StartStopContinue.self, forKey: .type)
        printStyle = try PrintStyle(from: decoder)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try printStyle.encode(to: encoder)
    }
}

import XMLCoder
extension Extend: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
            return .element
        }
    }
}
