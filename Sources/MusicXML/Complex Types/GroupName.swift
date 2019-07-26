//
//  GroupName.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The group-name type describes the name or abbreviation of a part-group element. Formatting
/// attributes in the group-name type are deprecated in Version 2.0 in favor of the new
/// group-name-display and group-abbreviation-display elements.
public struct GroupName {
    public let value: String
    public let printStyle: PrintStyle?
    public let justify: Justify?
}

extension GroupName: Equatable { }
extension GroupName: Codable { }
