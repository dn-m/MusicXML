//
//  Stick.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The stick type represents pictograms where the material of the stick, mallet, or beater is
/// included.
public struct Stick {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let tip: TipDirection?

    // MARK: Elements

    public let stickType: StickType
    public let stickMaterial: StickMaterial

    // MARK: - Initializers

    public init(tip: TipDirection? = nil, stickType: StickType, stickMaterial: StickMaterial) {
        self.tip = tip
        self.stickType = stickType
        self.stickMaterial = stickMaterial
    }
}

extension Stick: Equatable {}
extension Stick: Codable {}

import XMLCoder
extension Stick: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.tip:
            return .attribute
        default:
        return .element
        }
    }
}
