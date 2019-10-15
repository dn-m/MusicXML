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
        // FIXME: Consider sharing this across `Partwise.Measure` and `Timewise.Measure` under the
        // hood.
        struct MeasureAttributes: Equatable, Hashable {
            let number: String
            let text: String?
            let implicit: Bool?
            let nonControlling: Bool?
            let width: Tenths?
            let optionalUniqueID: Int?
        }
        var partsByMeasureAttributes: [MeasureAttributes: [Timewise.Part]] = [:]
        for partwisePart in parts {
            for partwiseMeasure in partwisePart.measures {
                let attrs = MeasureAttributes(
                    number: partwiseMeasure.number,
                    text: partwiseMeasure.text,
                    implicit: partwiseMeasure.implicit,
                    nonControlling: partwiseMeasure.nonControlling,
                    width: partwiseMeasure.width,
                    optionalUniqueID: partwiseMeasure.optionalUniqueID
                )
                let timewisePart = Timewise.Part(
                    id: partwisePart.id,
                    musicData: partwiseMeasure.musicData
                )
                partsByMeasureAttributes[attrs, default: []].append(timewisePart)
            }
        }
        return Timewise(
            header: header,
            measures: partsByMeasureAttributes.map { attrs, parts in
                Timewise.Measure(
                    number: attrs.number,
                    text: attrs.text,
                    implicit: attrs.implicit,
                    nonControlling: attrs.nonControlling,
                    width: attrs.width,
                    optionalUniqueID: attrs.optionalUniqueID,
                    parts: parts
                )
            }
        )
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
