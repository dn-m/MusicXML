//
//  Slide.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Glissando and slide types both indicate rapidly moving from one pitch to the other so that
/// individual notes are not discerned. The distinction is similar to that between NIFF's glissando
/// and portamento elements. A slide is continuous between two notes and defaults to a solid line.
/// The optional text for a is printed alongside the line.
public struct Slide {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStop
    public let number: Int?
    public let lineType: LineType?

    // MARK: Attribute Groups

    public let dashedFormatting: DashedFormatting
    public let printStyle: PrintStyle
    public let font: Font
    public let bendSound: BendSound

    // MARK: Value

    public let value: String?

    // MARK: - Initializers

    public init(_ value: String? = nil, type: StartStop, number: Int? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), printStyle: PrintStyle = PrintStyle(), font: Font = Font(), bendSound: BendSound = BendSound()) {
        self.value = value
        self.type = type
        self.number = number
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.printStyle = printStyle
        self.font = font
        self.bendSound = bendSound
    }
}

extension Slide: Equatable {}
extension Slide: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case value = ""
        case type
        case number
        case lineType = "line-type"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.type = try container.decode(StartStop.self, forKey: .type)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        self.dashedFormatting = try DashedFormatting(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        self.font = try Font(from: decoder)
        self.bendSound = try BendSound(from: decoder)
    }
}

import XMLCoder
extension Slide: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
