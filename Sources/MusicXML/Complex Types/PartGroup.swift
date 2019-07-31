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
    public let type: StartStop
    public let number: Int?
    public let name: GroupName?
    public let nameDisplay: NameDisplay?
    public let abbreviation: GroupName?
    public let abbreviationDisplay: NameDisplay?
    public let symbol: GroupSymbol?
    public let barline: GroupBarline?
    public let time: Bool?
    public let editorial: Editorial?
}

extension PartGroup: Equatable { }
extension PartGroup: Codable { }
