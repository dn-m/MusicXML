//
//  Score.Header.swift
//  MusicXML
//
//  Created by James Bean on 12/18/18.
//

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
