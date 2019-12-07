//
//  Tremolo.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tremolo ornament can be used to indicate either single-note or double-note tremolos.
/// Single-note tremolos use the single type, while double-note tremolos use the start and stop
/// types. The default is "single" for compatibility with Version 1.1. The text of the element
/// indicates the number of tremolo marks and is an integer from 0 to 8. Note that the number of
/// attached beams is not included in this value, but is represented separately using the beam
/// element. When using double-note tremolos, the duration of each note in the tremolo should
/// correspond to half of the notated type value. A time-modification element should also be added
/// with an actual-notes value of 2 and a normal-notes value of 1. If used within a tuplet, this
/// 2/1 ratio should be multiplied by the existing tuplet ratio.  Using repeater beams for
/// indicating tremolos is deprecated as of MusicXML 3.0.
public struct Tremolo {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopSingle?
    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Value

    public let marks: Int

    // MARK: - Initializers

    public init(
        marks: Int,
        type: StartStopSingle? = nil,
        printStyle: PrintStyle = PrintStyle(),
        placement: AboveBelow? = nil
    ) {
        self.marks = marks
        self.type = type
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Tremolo: Equatable {}
extension Tremolo: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case marks = ""
        case type
        case printStyle
        case placement
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode value
        self.marks = try container.decode(Int.self, forKey: .marks)
        // Decode one-off attributes
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        self.type = try container.decodeIfPresent(StartStopSingle.self, forKey: .type)
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
    }
}

import XMLCoder
extension Tremolo: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        default:
            return .element
        }
    }
}
