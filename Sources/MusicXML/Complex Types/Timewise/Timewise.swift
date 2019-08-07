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

    public var work: Work?
    public var movementNumber: String?
    public var movementTitle: String?
    public var identification: Identification?
    public var defaults: Defaults?
    public var credits: [Credit]?
    public var partList: PartList

    /// The `Measure` values which comprise a `Timewise` traversal of a `MusicXML` score.
    let measures: [Measure]
}

extension Timewise: Equatable { }

extension Timewise: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case identification
        case defaults
        case credits = "credit"
        case partList = "part-list"
        case measures = "measure"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.measures = try container.decode([Measure].self, forKey: .measures)
        // There is not currently a way for the `XMLDecoder` to check against the case of the
        // `Traversal` type at the top-level. A `Timewise` traversal must have at least one measure.
        guard !self.measures.isEmpty else {
            throw DecodingError.typeMismatch(
                Partwise.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected Partwise traversal but no parts found"
                )
            )
        }
        self.work = try container.decodeIfPresent(Work.self, forKey: .work)
        self.movementNumber = try container.decodeIfPresent(String.self, forKey: .movementNumber)
        self.movementTitle = try container.decodeIfPresent(String.self, forKey: .movementTitle)
        self.identification = try container.decodeIfPresent(Identification.self, forKey: .identification)
        self.defaults = try container.decodeIfPresent(Defaults.self, forKey: .defaults)
        self.credits = try container.decodeIfPresent([Credit].self, forKey: .credits)
        self.partList = try container.decode(PartList.self, forKey: .partList)
    }
}
