//
//  OctaveShift.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The octave shift type indicates where notes are shifted up or down from their true pitched
/// values because of printing difficulty. Thus a treble clef line noted with 8va will be indicated
/// with an octave-shift down from the pitch data indicated in the notes. A size of 8 indicates one
/// octave; a size of 15 indicates two octaves.
public struct OctaveShift {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: UpDownStopContinue
    public let number: Int?
    public let size: Int?

    // MARK: Attribute Groups

    public let dashedFormatting: DashedFormatting
    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(type: UpDownStopContinue, number: Int? = nil, size: Int? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), printStyle: PrintStyle = PrintStyle()) {
        self.type = type
        self.number = number
        self.size = size
        self.dashedFormatting = dashedFormatting
        self.printStyle = printStyle
    }
}

extension OctaveShift: Equatable {}
extension OctaveShift: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case type
        case number
        case size
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(UpDownStopContinue.self, forKey: .type)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.size = try container.decodeIfPresent(Int.self, forKey: .size)
        self.dashedFormatting = try DashedFormatting(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

import XMLCoder
extension OctaveShift: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.size:
            return .attribute
        default:
            return .element
        }
    }
}
