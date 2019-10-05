//
//  OtherPlay.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The other-play element represents other types of playback. The required type attribute indicates
/// the type of playback to which the element content applies.
public struct OtherPlay {
    public let value: String
    public let type: String

    public init(value: String, type: String) {
        self.value = value
        self.type = type
    }
}

extension OtherPlay: Equatable { }
extension OtherPlay: Codable { }
