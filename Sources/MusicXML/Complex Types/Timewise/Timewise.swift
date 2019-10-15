//
//  Timewise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `timewise` traversal of a `MusicXML` score.
public struct Timewise {

    // MARK: Elements
    public let header: Header

    /// The `Measure` values which comprise a `Timewise` traversal of a `MusicXML` score.
    public let measures: [Measure]

    public init(header: Header, measures: [Measure]) {
        self.header = header
        self.measures = measures
    }
}

extension Timewise {

    // MARK: - Instance Methods

    public func toPartwise() -> Partwise {
        fatalError()
    }
}

extension Timewise: Equatable { }

extension Timewise: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case measures = "measure"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try Header(from: decoder)
        self.measures = try container.decode([Measure].self, forKey: .measures)
        // There is not currently a way for the `XMLDecoder` to check against the case of the
        // `Traversal` type at the top-level. A `Timewise` traversal must have at least one measure.
        guard !self.measures.isEmpty else {
            throw DecodingError.typeMismatch(
                Partwise.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected Timewise traversal but no measures found"
                )
            )
        }
    }
}
