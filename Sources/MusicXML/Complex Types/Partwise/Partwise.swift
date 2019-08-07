//
//  Partwise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `partwise` traversal of a MusicXML score.
public struct Partwise: Equatable {

    // MARK: Elements
    
    public var work: Work?
    public var movementNumber: String?
    public var movementTitle: String?
    public var identification: Identification?
    public var defaults: Defaults?
    public var credits: [Credit]?
    public var partList: PartList
    public var parts: [Part]
}

extension Partwise: Codable {

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
