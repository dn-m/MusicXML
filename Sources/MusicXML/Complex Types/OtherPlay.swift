//
//  OtherPlay.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The other-play element represents other types of playback. The required type attribute indicates
/// the type of playback to which the element content applies.
public struct OtherPlay {
    // MARK: - Instance Properties

    public let value: String
    public let type: String

    // MARK: - Initializers

    public init(_ value: String, type: String) {
        self.value = value
        self.type = type
    }
}

extension OtherPlay: Equatable {}
extension OtherPlay: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension OtherPlay: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
