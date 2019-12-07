//
//  PrintStyleTrillSound
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The `PrintStyleTrillSound` type represents an empty element with print-style, placement, and
/// trill-sound attributes.
public struct PrintStyleTrillSound {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle
    public let trillSound: TrillSound

    // MARK: - Initializers

    public init(printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil, trillSound: TrillSound = TrillSound()) {
        self.printStyle = printStyle
        self.placement = placement
        self.trillSound = trillSound
    }
}

extension PrintStyleTrillSound: Equatable {}
extension PrintStyleTrillSound: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case placement
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printStyle = try PrintStyle(from: decoder)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        self.trillSound = try TrillSound(from: decoder)
    }
}

extension PrintStyleTrillSound.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension PrintStyleTrillSound: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
            return .element
        }
    }
}
