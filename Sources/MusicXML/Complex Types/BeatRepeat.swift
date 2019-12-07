//
//  BeatRepeat.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The beat-repeat type is used to indicate that a single beat (but possibly many notes) is
/// repeated. Both the start and stop of the beat being repeated should be specified. The
/// beat-repeat element specifies a notation style for repetitions. The actual music being repeated
/// needs to be repeated within the MusicXML file. This element specifies the notation that
/// indicates the repeat.
public struct BeatRepeat {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStop
    public let slashes: Int
    public let useDots: Bool

    // FIXME: Add elements

    // MARK: - Initializers

    public init(type: StartStop, slashes: Int, useDots: Bool) {
        self.type = type
        self.slashes = slashes
        self.useDots = useDots
    }
}

extension BeatRepeat: Equatable {}
extension BeatRepeat: Codable {}

import XMLCoder
// sourcery:inline:BeatRepeat.DynamicNodeEncoding
extension BeatRepeat: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.slashes:
            return .attribute
        case CodingKeys.useDots:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
