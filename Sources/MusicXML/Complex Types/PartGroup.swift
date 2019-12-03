//
//  PartGroup.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The part-group element indicates groupings of parts in the score, usually indicated by braces
/// and brackets. Braces that are used for multi-staff parts should be defined in the attributes
/// element for that part. The part-group start element appears before the first score-part in the
/// group. The part-group stop element appears after the last score-part in the group.  The number
/// attribute is used to distinguish overlapping and nested part-groups, not the sequence of groups.
/// As with parts, groups can have a name and abbreviation. Values for the child elements are
/// ignored at the stop of a group.  A part-group element is not needed for a single multi-staff
/// part. By default, multi-staff parts include a brace symbol and (if appropriate given the
/// bar-style) common barlines. The symbol formatting for a multi-staff part can be more fully
/// specified using the part-symbol element.
public struct PartGroup {
    // MARK: - Instance Properties

    public var type: StartStop
    public var number: Int?
    public var name: GroupName?
    public var nameDisplay: NameDisplay?
    public var abbreviation: GroupName?
    public var abbreviationDisplay: NameDisplay?
    public var symbol: GroupSymbol?
    public var barline: GroupBarline?
    public var time: Bool?
    public var editorial: Editorial?

    public init(type: StartStop, number: Int? = nil, name: GroupName? = nil, nameDisplay: NameDisplay? = nil, abbreviation: GroupName? = nil, abbreviationDisplay: NameDisplay? = nil, symbol: GroupSymbol? = nil, barline: GroupBarline? = nil, time: Bool? = nil, editorial: Editorial? = nil) {
        self.type = type
        self.number = number
        self.name = name
        self.nameDisplay = nameDisplay
        self.abbreviation = abbreviation
        self.abbreviationDisplay = abbreviationDisplay
        self.symbol = symbol
        self.barline = barline
        self.time = time
        self.editorial = editorial
    }
}

extension PartGroup: Equatable {}
extension PartGroup: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case number
        case name
        case nameDisplay = "name-display"
        case abbreviation
        case abbreviationDisplay = "abbreviation-display"
        case symbol = "group-symbol"
        case barline = "group-barline"
        case time
        case editorial
    }
}
