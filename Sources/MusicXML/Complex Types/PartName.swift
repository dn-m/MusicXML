//
//  PartName.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The part-name type describes the name or abbreviation of a score-part element. Formatting
/// attributes for the part-name element are deprecated in Version 2.0 in favor of the new
/// part-name-display and part-abbreviation-display elements.
public struct PartName {
    public let value: String
    public let printStyle: PrintStyle?
    public let printObject: Bool?
    public let justification: Justify?
}

extension PartName: Equatable { }
extension PartName: Codable { }
