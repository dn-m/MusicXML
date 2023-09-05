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

    public var work: Work?
    public var movementNumber: String?
    public var movementTitle: String?
    public var identification: Identification?
    public var defaults: Defaults?
    public var credits: [Credit]?
    public var partList: PartList
    public var parts: [Part]

    // MARK: - Initializers

    public init(work: Work? = nil, movementNumber: String? = nil, movementTitle: String? = nil, identification: Identification? = nil, defaults: Defaults? = nil, credits: [Credit]? = nil, partList: PartList, parts: [Part]) {
        self.work = work
        self.movementNumber = movementNumber
        self.movementTitle = movementTitle
        self.identification = identification
        self.defaults = defaults
        self.credits = credits
        self.partList = partList
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
            header: Header(
                work: work,
                movementNumber: movementNumber,
                movementTitle: movementTitle,
                identification: identification,
                defaults: defaults,
                credits: credits,
                partList: partList
            ),
            measures: partsByMeasureAttributes.map(Timewise.Measure.init)
        )
    }
}

extension Partwise: Equatable {}

extension Partwise: Codable {
    // MARK: - Codable

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case identification
        case defaults
        case credits = "credit"
        case partList = "part-list"
        case parts = "part"
    }
}

import XMLCoder
extension Partwise: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
