//
//  Partwise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `partwise` traversal of a MusicXML score.
public struct Partwise {
    // MARK: - Instance Properties

    // MARK: Elements

    public let header: Header
    public var parts: [Part]

    // MARK: - Initializers

    public init(header: Header, parts: [Part]) {
        self.header = header
        self.parts = parts
    }
}

extension Partwise {
    // MARK: - Instance Methods

    /// - Returns: A `Timewise` representation of this `Partwise` traversal.
    public func toTimewise() -> Timewise {
        var partsByMeasureAttributes: [MeasureAttributes: [Timewise.Part]] = [:]
        for partwisePart in parts {
            for partwiseMeasure in partwisePart.measures {
                let timewisePart = Timewise.Part(
                    id: partwisePart.id,
                    musicData: partwiseMeasure.musicData
                )
                partsByMeasureAttributes[partwiseMeasure.attributes, default: []]
                    .append(timewisePart)
            }
        }
        return Timewise(
            header: header,
            measures: partsByMeasureAttributes.map(Timewise.Measure.init)
        )
    }
}

extension Partwise: Equatable {}

extension Partwise: Codable {
    // MARK: - Codable

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case parts = "part"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try Header(from: decoder)
        self.parts = try container.decode([Part].self, forKey: .parts)
        // There is not currently a way for the `XMLDecoder` to check against the case of the
        // `Score` type at the top-level. A `Partwise` traversal must have at least one part.
        guard !parts.isEmpty else {
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

import XMLCoder
extension Partwise: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
