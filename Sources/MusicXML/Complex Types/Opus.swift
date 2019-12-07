//
//  Opus.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The opus type represents a link to a MusicXML opus document that composes multiple MusicXML
/// scores into a collection.
// TODO: Flesh out Opus
public struct Opus {
    // MARK: - Instance Properties

    // MARK: - Initializers

    public init() {}
}

extension Opus: Equatable {}
extension Opus: Codable {}

import XMLCoder
extension Opus: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
