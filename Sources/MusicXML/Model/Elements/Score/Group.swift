//
//  Group.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > The group element allows the use of different versions of
// > the part for different purposes. Typical values include
// > score, parts, sound, and data. Ordering information that is
// > directly encoded in MuseData can be derived from the
// > ordering within a MusicXML score or opus.
//
// <!ELEMENT group (#PCDATA)>
public struct Group {
    let value: String
}

// > The part-group element indicates groupings of parts in the
// > score, usually indicated by braces and brackets. Braces
// > that are used for multi-staff parts should be defined in
// > the attributes element for that part. The part-group start
// > element appears before the first score-part in the group.
// > The part-group stop element appears after the last
// > score-part in the group.
//
// > The number attribute is used to distinguish overlapping
// > and nested part-groups, not the sequence of groups. As
// > with parts, groups can have a name and abbreviation.
// > Formatting attributes for group-name and group-abbreviation
// > are deprecated in Version 2.0 in favor of the new
// > group-name-display and group-abbreviation-display elements.
// > Formatting specified in the group-name-display and
// > group-abbreviation-display elements overrides formatting
// > specified in the group-name and group-abbreviation
// > elements, respectively.
// > The group-time element indicates that the
// > displayed time signatures should stretch across all parts
// > and staves in the group. Values for the child elements
// > are ignored at the stop of a group.
// > A part-group element is not needed for a single multi-staff
// > part. By default, multi-staff parts include a brace symbol
// > and (if appropriate given the bar-style) common barlines.
// > The symbol formatting for a multi-staff part can be more
// > fully specified using the part-symbol element, defined in
// > the attributes.mod file.
//
// <!ELEMENT part-group (group-name?, group-name-display?,
//    group-abbreviation?, group-abbreviation-display?,
//    group-symbol?, group-barline?, group-time?, %editorial;)>
// <!ATTLIST part-group
//    type %start-stop; #REQUIRED
//    number CDATA "1"
// >
public struct PartGroup: Decodable, Equatable {
    let type: StartStop
    let number: Int?
    let name: GroupName?
    let nameDisplay: GroupNameDisplay?
    let abbreviation: GroupAbbreviation?
    let abbreviationDisplay: GroupAbbreviationDisplay?
    let symbol: GroupSymbol?
    let barline: GroupBarline?
    // <!ELEMENT group-time EMPTY>
    let time: Bool?
    let editorial: Editorial?
}



// <!ELEMENT group-name-display
//    ((display-text | accidental-text)*)>
// <!ATTLIST group-name-display
//    %print-object;
// >
public struct GroupNameDisplay: Decodable, Equatable {
    public enum Element: Decodable, Equatable {
        case displayText(DisplayText)
        case accidentalText(AccidentalText)
        enum CodingKeys: String, CodingKey {
            case displayText
            case accidentalText
        }
        public init(from decoder: Decoder) throws {
            let keyed = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .displayText(try keyed.decode(DisplayText.self, forKey: .displayText))
            } catch {
                self = .accidentalText(try keyed.decode(AccidentalText.self.self, forKey: .accidentalText))
            }
        }
    }
    let elements: [Element]?
    let printObject: Bool?
}

// <!ELEMENT group-abbreviation (#PCDATA)>
// <!ATTLIST group-abbreviation
//    %print-style;
//    %justify;
// >
public struct GroupAbbreviation: Decodable, Equatable {
    let value: String
    let printStyle: PrintStyle?
    let justification: Justify?
}

// <!ELEMENT group-abbreviation-display
//    ((display-text | accidental-text)*)>
// <!ATTLIST group-abbreviation-display
//    %print-object;
// >
public struct GroupAbbreviationDisplay: Decodable, Equatable {
    public enum Element: Decodable, Equatable {
        case displayText(DisplayText)
        case accidentalText(AccidentalText)
        enum CodingKeys: String, CodingKey {
            case displayText
            case accidentalText
        }
        public init(from decoder: Decoder) throws {
            let keyed = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .displayText(try keyed.decode(DisplayText.self, forKey: .displayText))
            } catch {
                self = .accidentalText(try keyed.decode(AccidentalText.self.self, forKey: .accidentalText))
            }
        }
    }
    let elements: [Element]?
    let printObject: Bool?
}
