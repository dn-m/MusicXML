//
//  Partwise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `partwise` traversal of a MusicXML score.
public struct Partwise {

    // MARK: Elements
    
    public let header: Header
    public var parts: [Part]

    public init(header: Header, parts: [Part]) {
        self.header = header
        self.parts = parts
    }
}

extension Partwise {

    // MARK: - Instance Methods

    public func toTimewise() -> Timewise {
        fatalError()
    }
}

extension Partwise: Equatable { }

extension Partwise: Codable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case parts = "part"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try Header(from: decoder)
        self.parts = try container.decode([Part].self, forKey: .parts)
        // There is not currently a way for the `XMLDecoder` to check against the case of the
        // `Traversal` type at the top-level. A `Partwise` traversal must have at least one part.
        guard !self.parts.isEmpty else {
            throw DecodingError.typeMismatch(
                Partwise.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected Partwise traversal but no parts found"
                )
            )
        }
    }
}
