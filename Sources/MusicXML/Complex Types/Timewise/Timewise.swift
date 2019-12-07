//
//  Timewise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `timewise` traversal of a `MusicXML` score.
public struct Timewise {
    // MARK: - Instance Properties

    // MARK: Elements

    public let header: Header

    /// The `Measure` values which comprise a `Timewise` traversal of a `MusicXML` score.
    public let measures: [Measure]

    // MARK: - Initializers

    public init(header: Header, measures: [Measure]) {
        self.header = header
        self.measures = measures
    }
}

extension Timewise {
    // MARK: - Instance Methods

    /// - Returns: A `Partwise` representation of this `Timewise` traversal.
    public func toPartwise() -> Partwise {
        var measuresByPartID: [String: [Partwise.Measure]] = [:]
        for timewiseMeasure in measures {
            for timewisePart in timewiseMeasure.parts {
                let partwiseMeasure = Partwise.Measure(
                    attributes: timewiseMeasure.attributes,
                    musicData: timewisePart.musicData
                )
                measuresByPartID[timewisePart.id, default: []].append(partwiseMeasure)
            }
        }
        return Partwise(header: header, parts: measuresByPartID.map(Partwise.Part.init))
    }
}

extension Timewise: Equatable {}

extension Timewise: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case measures = "measure"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try Header(from: decoder)
        self.measures = try container.decode([Measure].self, forKey: .measures)
        // There is not currently a way for the `XMLDecoder` to check against the case of the
        // `Score` type at the top-level. A `Timewise` traversal must have at least one measure.
        guard !measures.isEmpty else {
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

import XMLCoder
extension Timewise: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
