//
//  Header.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

// > The score-header entity contains basic score metadata
// > about the work and movement, score-wide defaults for
// > layout and fonts, credits that appear on the first page,
// > and the part list.
//
// <!ENTITY % score-header
// "(work?, movement-number?, movement-title?,
// identification?, defaults?, credit*, part-list)">
public struct Header: Equatable {
    // MARK: - Instance Properties

    public var work: Work?
    public var movementNumber: String?
    public var movementTitle: String?
    public var identification: Identification?
    public var defaults: Defaults?
    public var credits: [Credit]?
    public var partList: PartList

    // MARK - Initializers

    public init(work: Work? = nil, movementNumber: String? = nil, movementTitle: String? = nil, identification: Identification? = nil, defaults: Defaults? = nil, credits: [Credit]? = nil, partList: PartList) {
        self.work = work
        self.movementNumber = movementNumber
        self.movementTitle = movementTitle
        self.identification = identification
        self.defaults = defaults
        self.credits = credits
        self.partList = partList
    }
}

extension Header: Codable {
    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case identification
        case defaults
        case credits = "credit"
        case partList = "part-list"
    }
}
