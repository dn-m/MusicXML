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
    public let value: String
    public let printStyle: PrintStyle
    public let justify: Justify?

    public init(_ value: String, printStyle: PrintStyle = PrintStyle(), justify: Justify? = nil) {
        self.value = value
        self.printStyle = printStyle
        self.justify = justify
    }
}

extension GroupName: Equatable { }
extension GroupName: Codable {
    enum CodingKeys: String, CodingKey {
        case justify
        case value = ""
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        printStyle = try PrintStyle(from: decoder)
        justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(justify, forKey: .justify)
    }
}
