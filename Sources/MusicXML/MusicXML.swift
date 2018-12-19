//
//  PartwiseParser.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

/// A MusicXML document.
public struct MusicXML {

    /// The MusicXML.Score which is contained within a MusicXML document.
    let score: Score

    // TODO: Version
}

extension MusicXML.Score {

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
        // TODO: identification
        // TODO: defaults
        // TODO: credit *
        let partList: PartList
    }
}

extension MusicXML.Score {

    public struct Partwise: Equatable {
        let parts: [Part]
    }
}

extension MusicXML.Score.Partwise {

    // MARK: - Nested Types

    // In either format, the part element has an id attribute that
    // is an IDREF back to a score-part in the part-list. Measures
    // have a required number attribute (going from partwise to
    // timewise, measures are grouped via the number).
    //
    // <!ATTLIST part
    //    id IDREF #REQUIRED
    // >
    public struct Part: Equatable {
        let id: String
        let measures: [Measure]
    }

    // > The implicit attribute is set to "yes" for measures where
    // > the measure number should never appear, such as pickup
    // > measures and the last half of mid-measure repeats. The
    // > value is "no" if not specified.
    //
    // > The non-controlling attribute is intended for use in
    // > multimetric music like the Don Giovanni minuet. If set
    // > to "yes", the left barline in this measure does not
    // > coincide with the left barline of measures in other
    // > parts. The value is "no" if not specified.
    // > In partwise files, the number attribute should be the same
    // > for measures in different parts that share the same left
    // > barline. While the number attribute is often numeric, it
    // > does not have to be. Non-numeric values are typically used
    // > together with the implicit or non-controlling attributes
    // > being set to "yes". For a pickup measure, the number
    // > attribute is typically set to "0" and the implicit attribute
    // > is typically set to "yes".
    // > If measure numbers are not unique within a part, this can
    // > cause problems for conversions between partwise and timewise
    // > formats. The text attribute allows specification of displayed
    // > measure numbers that are different than what is used in the
    // > number attribute. This attribute is ignored for measures
    // > where the implicit attribute is set to "yes". The text
    // > attribute for a measure element has at least one character.
    // > Further details about measure numbering can be specified
    // > using the measure-numbering element defined in the
    // > direction.mod file.
    // > Measure width is specified in tenths. These are the
    // > global tenths specified in the scaling element, not
    // > local tenths as modified by the staff-size element.
    // > The width covers the entire measure from barline
    // > or system start to barline or system end.
    //
    // <!ATTLIST measure
    //     number CDATA #REQUIRED
    //     text CDATA #IMPLIED
    //     implicit %yes-no; #IMPLIED
    //     non-controlling %yes-no; #IMPLIED
    //     width %tenths; #IMPLIED
    //     %optional-unique-id;
    // >
    public struct Measure: Equatable {
        let number: Int
        let attributes: [MusicXML.Attributes]?
        let text: String?
        let implicit: Bool?
        let nonControlling: Bool?
        let width: Int? // Tenths
        let optionalUniqueID: Int?
        let musicData: MusicXML.MusicData
    }
}

extension MusicXML.Score.Partwise: Decodable {
    enum CodingKeys: String, CodingKey {
        case parts = "part"
    }
}

extension MusicXML.Score.Partwise.Part: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case measures = "measure"
    }
}

extension MusicXML.Score.Partwise.Measure: Decodable {

    enum CodingKeys: String, CodingKey {
        case number
        case attributes
        case text
        case implicit
        case nonControlling = "non-controlling"
        case width
        case optionalUniqueID = "optional-unique-id"
    }

    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        var unkeyed = try decoder.unkeyedContainer()
        self.number = try keyed.decode(Int.self, forKey: .number)
        self.attributes = try keyed.decodeIfPresent([MusicXML.Attributes].self, forKey: .attributes)
        self.text = try keyed.decodeIfPresent(String.self, forKey: .text)
        self.implicit = try keyed.decodeIfPresent(Bool.self, forKey: .implicit)
        self.nonControlling = try keyed.decodeIfPresent(Bool.self, forKey: .nonControlling)
        self.width = try keyed.decodeIfPresent(Int.self, forKey: .width)
        self.optionalUniqueID = try keyed.decodeIfPresent(Int.self, forKey: .optionalUniqueID)
        self.musicData = try unkeyed.decode(MusicXML.MusicData.self)
    }
}


extension MusicXML.Score.Header {

    // MARK: - Nested Types

    // <!ELEMENT work (work-number?, work-title?, opus?)>
    // <!ELEMENT work-number (#PCDATA)>
    // <!ELEMENT work-title (#PCDATA)>
    public struct Work: Equatable {
        let number: String?
        let title: String?
        let opus: Opus?
    }

    // <!ELEMENT opus EMPTY>
    // <!ATTLIST opus
    //    %link-attributes;
    // >
    #warning("TODO: Implement Opus")
    public struct Opus: Decodable, Equatable {
        //let linkAttributes: LinkAttributes
    }

    // > The part-list identifies the different musical parts in
    // > this movement. Each part has an ID that is used later
    // > within the musical data. Since parts may be encoded
    // > separately and combined later, identification elements
    // > are present at both the score and score-part levels.
    // > There must be at least one score-part, combined as
    // > desired with part-group elements that indicate braces
    // > and brackets. Parts are ordered from top to bottom in
    // > a score based on the order in which they appear in the
    // > part-list.
    //
    // > Each MusicXML part corresponds to a track in a Standard
    // > MIDI Format 1 file. The score-instrument elements are
    // > used when there are multiple instruments per track.
    // > The midi-device element is used to make a MIDI device
    // > or port assignment for the given track or specific MIDI
    // > instruments. Initial midi-instrument assignments may be
    // > made here as well.
    // > The part-name-display and part-abbreviation-display
    // > elements are defined in the common.mod file, as they can
    // > be used within both the score-part and print elements.
    //
    // <!ELEMENT part-list (part-group*, score-part,
    //    (part-group | score-part)*)>
    // <!ELEMENT score-part (identification?,
    //    part-name, part-name-display?,
    //    part-abbreviation?, part-abbreviation-display?,
    //    group*, score-instrument*,
    //    (midi-device?, midi-instrument?)*)>
    #warning("TODO: Build out MusicXML.PartList")
    public struct PartList: Equatable {

        // <!ATTLIST score-part
        //    id ID #REQUIRED
        //
        // The part-name indicates the full name of the musical part.
        // The part-abbreviation indicates the abbreviated version of
        // the name of the musical part. The part-name will often
        // precede the first system, while the part-abbreviation will
        // precede the other systems.
        //
        // The formatting attributes for
        // these elements are deprecated in Version 2.0 in favor of
        // the new part-name-display and part-abbreviation-display
        // elements. These are defined in the common.mod file as they
        // are used in both the part-list and print elements. They
        // provide more complete formatting control for how part names
        // and abbreviations appear in a score.
        //
        // <!ELEMENT part-name (#PCDATA)>
        // <!ATTLIST part-name
        //     %print-style;
        //     %print-object;
        //     %justify;
        // >
        // <!ELEMENT part-abbreviation (#PCDATA)>
        // <!ATTLIST part-abbreviation
        //     %print-style;
        //     %print-object;
        //     %justify;
        // >
        public struct ScorePart: Decodable, Equatable {

            enum CodingKeys: String, CodingKey {
                case id
                case name = "part-name"
            }

            let id: String
            let name: String

            #warning("TODO: Support MusicXML.ScorePart attributes print-style, print-object, justify")
            public init(id: String, name: String) {
                self.id = id
                self.name = name
            }
        }

        let parts: [ScorePart]
    }
}

extension MusicXML.Score.Header.PartList: Decodable {
    enum CodingKeys: String, CodingKey {
        case parts = "score-part"
    }
}

extension MusicXML.Score.Header.Work: Decodable { }

extension MusicXML.Score.Header: Decodable {
    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case partList = "part-list"
        // TODO: identification
        // TODO: defaults
        // TODO: credits = "credit"
    }
}
