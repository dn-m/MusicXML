//
//  Editorial.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// > Two entities for editorial information in notes. These
// > entities, and their elements defined below, are used
// > across all the different component DTD modules.
//
// <!ENTITY % editorial "(footnote?, level?)">
public struct Editorial {
    // MARK: - Instance Properties

    public let footnote: FormattedText?
    public let level: Level?

    public init(footnote: FormattedText? = nil, level: Level? = nil) {
        self.footnote = footnote
        self.level = level
    }
}

extension Editorial: Equatable {}
extension Editorial: Codable {}
