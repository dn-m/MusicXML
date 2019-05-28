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
