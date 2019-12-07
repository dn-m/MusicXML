//
//  Work.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Works are optionally identified by number and title. The work type also may indicate a link to
/// the opus document that composes multiple scores into a collection.
public struct Work {
    // MARK: - Instance Properties

    // MARK: Elements

    public let number: String?
    public let title: String?
    public let opus: Opus?

    // MARK: - Initializers

    public init(number: String? = nil, title: String? = nil, opus: Opus? = nil) {
        self.number = number
        self.title = title
        self.opus = opus
    }
}

extension Work: Equatable {}
extension Work: Codable {}

import XMLCoder
extension Work: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
