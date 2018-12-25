//
//  ScoreInstrument.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > The score-instrument element allows for multiple
// > instruments per score-part. As with the score-part
// > element, each score-instrument has a required ID
// > attribute, a name, and an optional abbreviation. The
// > instrument-name and instrument-abbreviation are
// > typically used within a software application, rather
// > than appearing on the printed page of a score.
// > A score-instrument element is also required if the
// > score specifies MIDI 1.0 channels, banks, or programs.
// > An initial midi-instrument assignment can also
// > be made here.
// > The instrument-sound and virtual-instrument elements
// > are new as of Version 3.0. The instrument-sound element
// > describes the default timbre of the score-instrument. This
// > description is independent of a particular virtual or
// > MIDI instrument specification and allows playback to be
// > shared more easily between applications and libraries.
// > The virtual-instrument element defines a specific virtual
// > instrument used for an instrument sound. The
// > virtual-library element indicates the virtual instrument
// > library name, and the virtual-name element indicates the
// > library-specific name for the virtual instrument.
// > The solo and ensemble elements are new as of Version
// > 2.0. The solo element is present if performance is
// > intended by a solo instrument. The ensemble element
// > is present if performance is intended by an ensemble
// > such as an orchestral section. The text of the
// > ensemble element contains the size of the section,
// > or is empty if the ensemble size is not specified.
//
// > The midi-instrument element is defined in the common.mod
// > file, as it can be used within both the score-part and
// > sound elements.
//
// <!ELEMENT score-instrument
//    (instrument-name, instrument-abbreviation?,
//     instrument-sound?, (solo | ensemble)?,
//     virtual-instrument?)>
// <!ATTLIST score-instrument
//    id ID #REQUIRED
// >
public struct ScoreInstrument: Decodable, Equatable {

    //<!ELEMENT solo EMPTY>
    //<!ELEMENT ensemble (#PCDATA)>
    public enum SoloOrEnsemble: Decodable, Equatable {
        case solo
        case ensemble(String)
        enum CodingKeys: String, CodingKey {
            case solo
            case ensemble
        }
        public init(from decoder: Decoder) throws {
            let keyed = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .ensemble(try keyed.decode(String.self, forKey: .ensemble))
            } catch {
                self = .solo
            }
        }
    }

    // MARK: - Attributes

    let id: String

    // MARK: - Elements

    //<!ELEMENT instrument-name (#PCDATA)>
    let name: String
    //<!ELEMENT instrument-abbreviation (#PCDATA)>
    let abbreviation: String
    //<!ELEMENT instrument-sound (#PCDATA)>
    let sound: String
    let soloOrEnsemble: SoloOrEnsemble?
    let virtualInstrument: VirtualInstrument?
}

//<!ELEMENT virtual-instrument
//    (virtual-library?, virtual-name?)>
public struct VirtualInstrument: Decodable, Equatable {
    //<!ELEMENT virtual-library (#PCDATA)>
    let library: String?
    //<!ELEMENT virtual-name (#PCDATA)>
    let name: String?
}
