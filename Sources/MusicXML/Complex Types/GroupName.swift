//
//  GroupName.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The group-name type describes the name or abbreviation of a part-group element. Formatting
/// attributes in the group-name type are deprecated in Version 2.0 in favor of the new
/// group-name-display and group-abbreviation-display elements.
public struct GroupName {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: Attributes

    public let justify: Justify?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(_ value: String, printStyle: PrintStyle = PrintStyle(), justify: Justify? = nil) {
        self.value = value
        self.printStyle = printStyle
        self.justify = justify
    }
}

extension GroupName: Equatable {}
extension GroupName: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case justify
        case value = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        printStyle = try PrintStyle(from: decoder)
        justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(justify, forKey: .justify)
    }
}

import XMLCoder
extension GroupName: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
