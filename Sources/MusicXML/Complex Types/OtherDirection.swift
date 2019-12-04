//
//  OtherDirection.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The other-direction type is used to define any direction symbols not yet in the current version
/// of the MusicXML format. This allows extended representation, though without application
/// interoperability.
public struct OtherDirection {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: Attributes

    public let printObject: Bool?

    // MARK: Attribute Groups

    public let printStyleAlign: PrintStyleAlign

    // MARK: - Initializers

    public init(_ value: String, printObject: Bool? = nil, printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        self.value = value
        self.printObject = printObject
        self.printStyleAlign = printStyleAlign
    }
}

extension OtherDirection: Equatable {}
extension OtherDirection: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case printObject
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try printStyleAlign.encode(to: encoder)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        printStyleAlign = try PrintStyleAlign(from: decoder)
    }
}

import XMLCoder
extension OtherDirection: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
