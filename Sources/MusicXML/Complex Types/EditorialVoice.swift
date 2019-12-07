//
//  EditorialVoice.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// <!ENTITY % editorial-voice "(footnote?, level?, voice?)">
public struct EditorialVoice {
    // MARK: - Instance Properties

    public let footnote: FormattedText?
    public let level: Level?
    public let voice: Int?

    // MARK: - Initializers

    public init(footnote: FormattedText? = nil, level: Level? = nil, voice: Int? = nil) {
        self.footnote = footnote
        self.level = level
        self.voice = voice
    }
}

extension EditorialVoice: Equatable {}
extension EditorialVoice: Codable {}

import XMLCoder
extension EditorialVoice: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
