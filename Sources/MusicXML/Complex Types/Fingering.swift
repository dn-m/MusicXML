//
//  Fingering.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Fingering is typically indicated 1,2,3,4,5. Multiple fingerings may be given, typically to
/// substitute fingerings in the middle of a note. For guitar and other fretted instruments, the
/// fingering element represents the fretting finger; the pluck element represents the plucking
/// finger.
public struct Fingering {
    public let value: String
    public let substitution: Bool?
    public let alternate: Bool?
    public let placement: AboveBelow?
    public let printStyle: PrintStyle

    public init(
        _ value: String = "",
        substitution: Bool? = nil,
        alternate: Bool? = nil,
        placement: AboveBelow? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.substitution = substitution
        self.alternate = alternate
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Fingering: Equatable {}
extension Fingering: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case substitution
        case alternate
        case placement
    }

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.substitution = try container.decodeIfPresent(Bool.self, forKey: .substitution)
        self.alternate = try container.decodeIfPresent(Bool.self, forKey: .alternate)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        // Decode value
        self.value = try container.decode(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(substitution, forKey: .substitution)
        try container.encodeIfPresent(alternate, forKey: .alternate)
        try container.encodeIfPresent(placement, forKey: .placement)
    }
}
