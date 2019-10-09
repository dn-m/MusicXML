//
//  DirectionType.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// Textual direction types may have more than 1 component due to multiple fonts. The dynamics
/// element may also be used in the notations element. Attribute groups related to print suggestions
/// apply to the individual direction-type, not to the overall direction.
public enum DirectionType {
    /// The accordion-registration type is use for accordion registration symbols. These are
    /// circular symbols divided horizontally into high, middle, and low sections that correspond to
    /// 4', 8', and 16' pipes. Each accordion-high, accordion-middle, and accordion-low element
    /// represents the presence of one or more dots in the registration diagram. An
    /// accordion-registration element needs to have at least one of the child elements present.
    case accordionRegistration(AccordionRegistration)
    /// Brackets are combined with words in a variety of modern directions.  The line-type is solid
    /// by default.
    case bracket(Bracket)
    /// The coda element is the visual indicator of a coda sign. A sound element is needed to guide
    /// playback applications reliably.
    case coda([EmptyPrintStyleAlign] /* NonEmpty */)
    /// The damp element specifies a harp damping mark.
    case damp(EmptyPrintStyleAlign)
    /// The damp-all element specifies a harp damping mark for all strings.
    case dampAll(EmptyPrintStyleAlign)
    /// The dashes type represents dashes, used for instance with cresc. and dim. marks.
    case dashes(Dashes)
    /// Dynamics can be associated either with a note or a general musical direction. To avoid
    /// inconsistencies between and amongst the letter abbreviations for dynamics (what is sf vs.
    /// sfz, standing alone or with a trailing dynamic that is not always piano), we use the actual
    /// letters as the names of these dynamic elements. The other-dynamics element allows other
    /// dynamic marks that are not covered here, but many of those should perhaps be included in a
    /// more general musical direction element. Dynamics elements may also be combined to create
    /// marks not covered by a single element, such as sfmp. These letter dynamic symbols are
    /// separated from crescendo, decrescendo, and wedge indications. Dynamic representation is
    /// inconsistent in scores. Many things are assumed by the composer and left out, such as
    /// returns to original dynamics. Systematic representations are quite complex: for example,
    /// Humdrum has at least 3 representation formats related to dynamics. The MusicXML format
    /// captures what is in the score, but does not try to be optimal for analysis or synthesis of
    /// dynamics.
    case dynamics([Dynamics])
    /// The eyeglasses element specifies the eyeglasses symbol, common in commercial music.
    case eyeglasses(EmptyPrintStyleAlign)
    /// The harp-pedals type is used to create harp pedal diagrams. The pedal-step and pedal-alter
    /// elements use the same values as the step and alter elements. For easiest reading, the
    /// pedal-tuning elements should follow standard harp pedal order, with pedal-step values of D,
    /// C, B, E, F, G, and A.
    case harpPedals(HarpPedals)
    /// The image type is used to include graphical images in a score.
    case image(Image)
    /// The metronome type represents metronome marks and other metric relationships. The beat-unit
    /// group and per-minute element specify regular metronome marks. The metronome-note and
    /// metronome-relation elements allow for the specification of more complicated metric
    /// relationships, such as swing tempo marks where two eighths are equated to a quarter note /
    /// eighth note triplet.
    case metronome(Metronome)
    /// The octave shift type indicates where notes are shifted up or down from their true pitched
    /// values because of printing difficulty. Thus a treble clef line noted with 8va will be
    /// indicated with an octave-shift down from the pitch data indicated in the notes.
    case octaveShift(OctaveShift)
    /// The other-direction type is used to define any direction symbols not yet in the current
    /// version of the MusicXML format. This allows extended representation, though without
    /// application interoperability.
    case otherDirection(OtherDirection)
    /// The pedal type represents piano pedal marks. The change and continue types are used when the
    /// line attribute is yes. The change type indicates a pedal lift and retake indicated with an
    /// inverted V marking. The continue type allows more precise formatting across system breaks
    /// and for more complex pedaling lines. The alignment attributes are ignored if the line
    /// attribute is yes.
    case pedal(Pedal)
    /// The percussion element is used to define percussion pictogram symbols. Definitions for these
    /// symbols can be found in Kurt Stone's "Music Notation in the Twentieth Century" on pages
    /// 206-212 and 223. Some values are added to these based on how usage has evolved in the 30
    /// years since Stone's book was published.
    case percussion([Percussion] /* NonEmpty */)
    /// The principal-voice element represents principal and secondary voices in a score, either for
    /// analysis or for square bracket symbols that appear in a score. The content of the
    /// principal-voice element is used for analysis and may be any text value. When used for
    /// analysis separate from any printed score markings, the symbol attribute should be set to
    /// "none".
    case principleVoice(PrincipleVoice)
    /// The rehearsal type specifies a rehearsal mark. Language is Italian ("it") by default.
    /// Enclosure is square by default. Left justification is assumed if not specified.
    case rehearsal([FormattedText] /* NonEmpty */)
    /// Scordatura string tunings are represented by a series of accord elements, similar to the
    /// staff-tuning elements. Strings are numbered from high to low.
    case scordatura(Scordatura)
    /// The segno element is the visual indicator of a segno sign. A sound element is needed to
    /// guide playback applications reliably.
    case segno(EmptyPrintStyleAlign)
    /// The string-mute type represents string mute on and mute off symbols.
    case stringMute(StringMute)
    /// The wedge type represents crescendo and diminuendo wedge symbols. The type attribute is
    /// crescendo for the start of a wedge that is closed at the left side, and diminuendo for the
    /// start of a wedge that is closed on the right side. Spread values are measured in tenths;
    /// those at the start of a crescendo wedge or end of a diminuendo wedge are ignored. The niente
    /// attribute is yes if a circle appears at the point of the wedge, indicating a crescendo from
    /// nothing or diminuendo to nothing. It is no by default, and used only when the type is
    /// crescendo, or the type is stop for a wedge that began with a diminuendo type. The line-type
    /// is solid by default.
    case wedge(Wedge)
    /// The words element specifies a standard text direction. Left justification is
    /// assumed if not specified. Language is Italian ("it") by default. Enclosure is none
    /// by default.
    case words(FormattedText)
}

extension DirectionType: Equatable { }

extension DirectionType: Codable {
    enum CodingKeys: String, CodingKey {
        case accordionRegistration = "accordion-registration"
        case bracket
        case coda
        case damp
        case dampAll = "damp-all"
        case dashes
        case dynamics
        case eyeglasses
        case harpPedals = "harp-pedals"
        case image
        case metronome
        case octaveShift = "octave-shift"
        case otherDirection = "other-direction"
        case pedal
        case percussion
        case principleVoice = "principle-voice"
        case rehearsal
        case scordatura
        case segno
        case stringMute = "string-mute"
        case wedge
        case words

    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .accordionRegistration(value):
            try container.encode(value, forKey: .accordionRegistration)
        case let .bracket(value):
            try container.encode(value, forKey: .bracket)
        case let .coda(value):
            try container.encode(value, forKey: .coda)
        case let .damp(value):
            try container.encode(value, forKey: .damp)
        case let .dampAll(value):
            try container.encode(value, forKey: .dampAll)
        case let .dashes(value):
            try container.encode(value, forKey: .dashes)
        case let .dynamics(value):
            try container.encode(value, forKey: .dynamics)
        case let .eyeglasses(value):
            try container.encode(value, forKey: .eyeglasses)
        case let .harpPedals(value):
            try container.encode(value, forKey: .harpPedals)
        case let .image(value):
            try container.encode(value, forKey: .image)
        case let .metronome(value):
            try container.encode(value, forKey: .metronome)
        case let .octaveShift(value):
            try container.encode(value, forKey: .octaveShift)
        case let .otherDirection(value):
            try container.encode(value, forKey: .otherDirection)
        case let .pedal(value):
            try container.encode(value, forKey: .pedal)
        case let .percussion(value):
            try container.encode(value, forKey: .percussion)
        case let .principleVoice(value):
            try container.encode(value, forKey: .principleVoice)
        case let .rehearsal(value):
            try container.encode(value, forKey: .rehearsal)
        case let .scordatura(value):
            try container.encode(value, forKey: .scordatura)
        case let .segno(value):
            try container.encode(value, forKey: .segno)
        case let .stringMute(value):
            try container.encode(value, forKey: .stringMute)
        case let .wedge(value):
            try container.encode(value, forKey: .wedge)
        case let .words(value):
            try container.encode(value, forKey: .words)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.accordionRegistration) {
            self = .accordionRegistration(try container.decode(AccordionRegistration.self, forKey: .accordionRegistration))
        } else if container.contains(.bracket) {
            self = .bracket(try container.decode(Bracket.self, forKey: .bracket))
        } else if container.contains(.coda) {
            self = .coda(try container.decode([EmptyPrintStyleAlign].self, forKey: .coda))
        } else if container.contains(.damp) {
            self = .damp(try container.decode(EmptyPrintStyleAlign.self, forKey: .damp))
        } else if container.contains(.dampAll) {
            self = .dampAll(try container.decode(EmptyPrintStyleAlign.self, forKey: .dampAll))
        } else if container.contains(.dashes) {
            self = .dashes(try container.decode(Dashes.self, forKey: .dashes))
        } else if container.contains(.dynamics) {
            self = .dynamics(try container.decode([Dynamics].self, forKey: .dynamics))
        } else if container.contains(.eyeglasses) {
            self = .eyeglasses(try container.decode(EmptyPrintStyleAlign.self, forKey: .eyeglasses))
        } else if container.contains(.harpPedals) {
            self = .harpPedals(try container.decode(HarpPedals.self, forKey: .harpPedals))
        } else if container.contains(.image) {
            self = .image(try container.decode(Image.self, forKey: .image))
        } else if container.contains(.metronome) {
            self = .metronome(try container.decode(Metronome.self, forKey: .metronome))
        } else if container.contains(.octaveShift) {
            self = .octaveShift(try container.decode(OctaveShift.self, forKey: .octaveShift))
        } else if container.contains(.otherDirection) {
            self = .otherDirection(try container.decode(OtherDirection.self, forKey: .otherDirection))
        } else if container.contains(.pedal) {
            self = .pedal(try container.decode(Pedal.self, forKey: .pedal))
        } else if container.contains(.percussion) {
            self = .percussion(try container.decode([Percussion].self, forKey: .percussion))
        } else if container.contains(.principleVoice) {
            self = .principleVoice(try container.decode(PrincipleVoice.self, forKey: .principleVoice))
        } else if container.contains(.rehearsal) {
            self = .rehearsal(try container.decode([FormattedText].self, forKey: .rehearsal))
        } else if container.contains(.scordatura) {
            self = .scordatura(try container.decode(Scordatura.self, forKey: .scordatura))
        } else if container.contains(.segno) {
            self = .segno(try container.decode(EmptyPrintStyleAlign.self, forKey: .segno))
        } else if container.contains(.stringMute) {
            self = .stringMute(try container.decode(StringMute.self, forKey: .stringMute))
        } else if container.contains(.wedge) {
            self = .wedge(try container.decode(Wedge.self, forKey: .wedge))
        } else if container.contains(.words) {
            self = .words(try container.decode(FormattedText.self, forKey: .words))
        } else {
            throw DecodingError.typeMismatch(
                DirectionType.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension DirectionType.CodingKeys: XMLChoiceCodingKey { }
