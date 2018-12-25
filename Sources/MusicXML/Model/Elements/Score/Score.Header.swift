//
//  Score.Header.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

extension Score {

    // > The score-header entity contains basic score metadata
    // > about the work and movement, score-wide defaults for
    // > layout and fonts, credits that appear on the first page,
    // > and the part list.
    //
    // <!ENTITY % score-header
    // "(work?, movement-number?, movement-title?,
    // identification?, defaults?, credit*, part-list)">
    public struct Header: Equatable {
        let work: Work?
        let movementNumber: String?
        let movementTitle: String?
        let identification: Identification?
        let defaults: Defaults?
        let credits: [Credit]?
        let partList: PartList
    }
}

extension Score.Header: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case partList = "part-list"
        case identification
        case defaults
        case credits = "credit"
    }
}
