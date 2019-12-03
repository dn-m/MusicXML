//
//  Notehead.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The notehead element indicates shapes other than the open and closed ovals associated with note
/// durations. For the enclosed shapes, the default is to be hollow for half notes and longer, and
/// filled otherwise. The filled attribute can be set to change this if needed.
public struct Notehead {
    // MARK: - Instance Properties

    public let value: NoteheadValue
    public let filled: Bool?
    public let parentheses: Bool?
    public let font: Font
    public let color: Color?

    // MARK - Initializers

    public init(_ value: NoteheadValue, filled: Bool? = nil, parentheses: Bool? = nil, font: Font = Font(), color: Color? = nil) {
        self.value = value
        self.filled = filled
        self.parentheses = parentheses
        self.font = font
        self.color = color
    }
}

extension Notehead: Equatable {}
extension Notehead: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case filled
        case parentheses
        case color
    }

    public init(from decoder: Decoder) throws {
        self.font = try Font(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(NoteheadValue.self, forKey: .value)
        self.filled = try container.decodeIfPresent(Bool.self, forKey: .filled)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }

    // sourcery:inline:Notehead.AutoEncodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(YesNo(filled), forKey: .filled)
        try container.encodeIfPresent(YesNo(parentheses), forKey: .parentheses)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }
    // sourcery:end
}

import XMLCoder
extension Notehead: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
