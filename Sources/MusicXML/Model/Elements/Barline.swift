//
//  Barline.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//    MusicXML barline.mod module
//
//    Version 3.1
//
//    Copyright © 2004-2017 the Contributors to the MusicXML
//    Specification, published by the W3C Music Notation Community
//    Group under the W3C Community Final Specification Agreement
//    (FSA):
//
//       https://www.w3.org/community/about/agreements/final/
//
//    A human-readable summary is available:
//
//       https://www.w3.org/community/about/agreements/fsa-deed/

// > If a barline is other than a normal single barline, it
// > should be represented by a barline element that describes
// > it. This includes information about repeats and multiple
// > endings, as well as line style. Barline data is on the same
// > level as the other musical data in a score - a child of a
// > measure in a partwise score, or a part in a timewise score.
// > This allows for barlines within measures, as in dotted
// > barlines that subdivide measures in complex meters. The two
// > fermata elements allow for fermatas on both sides of the
// > barline (the lower one inverted).
//
// > Barlines have a location attribute to make it easier to
// > process barlines independently of the other musical data
// > in a score. It is often easier to set up measures
// > separately from entering notes. The location attribute
// > must match where the barline element occurs within the
// > rest of the musical data in the score. If location is left,
// > it should be the first element in the measure, aside from
// > the print, bookmark, and link elements. If location is
// > right, it should be the last element, again with the
// > possible exception of the print, bookmark, and link
// > elements. If no location is specified, the right barline
// > is the default. The segno, coda, and divisions attributes
// > work the same way as in the sound element defined in the
// > direction.mod file. They are used for playback when barline
// > elements contain segno or coda child elements.
//
//<!-- Elements -->
//
//<!ELEMENT barline (bar-style?, %editorial;, wavy-line?,
//    segno?, coda?, (fermata, fermata?)?, ending?, repeat?)>
//<!ATTLIST barline
//    location (right | left | middle) "right"
//    segno CDATA #IMPLIED
//    coda CDATA #IMPLIED
//    divisions CDATA #IMPLIED
//    %optional-unique-id;
//>
public struct Barline: Equatable {

    public struct Fermatas: Decodable, Equatable {
        let above: Fermata?
        let below: Fermata?
    }

    public enum Location: String, Decodable, Equatable {
        case right
        case left
        case middle
    }

    let location: Location
    let barStyle: BarStyle?
    let editorial: Editorial
    let wavyLine: WavyLine?
    let segno: Segno?
    let coda: Coda?
    let fermatas: Fermatas?
    let ending: Ending?
    let `repeat`: Repeat?
    let divisions: Int?
    let optionalUniqueID: String?
}

// > Bar-style contains style information. Choices are
// > regular, dotted, dashed, heavy, light-light,
// > light-heavy, heavy-light, heavy-heavy, tick (a
// > short stroke through the top line), short (a partial
// > barline between the 2nd and 4th lines), and none.
//
// <!ELEMENT bar-style (#PCDATA)>
// <!ATTLIST bar-style
//    %color;
// >
public struct BarStyle: Decodable, Equatable {
    public enum Kind: String, Decodable, Equatable {
        case regular
        case dotted
        case dashed
        case heavy
        case lightLight = "light-light"
        case lightHeavy = "light-heavy"
        case heavyLight = "heavy-light"
        case heavyHeavy = "heavy-heavy"
        case tick
        case short
        case none
    }
    let kind: Kind
    let color: Color
}

// > The editorial entity and the wavy-line, segno, and fermata
// > elements are defined in the common.mod file. They can
// > apply to both notes and barlines.
//
// > Endings refers to multiple (e.g. first and second) endings.
// > Typically, the start type is associated with the left
// > barline of the first measure in an ending. The stop and
// > discontinue types are associated with the right barline of
// > the last measure in an ending. Stop is used when the ending
// > mark concludes with a downward jog, as is typical for first
// > endings. Discontinue is used when there is no downward jog,
// > as is typical for second endings that do not conclude a
// > piece. The length of the jog can be specified using the
// > end-length attribute. The text-x and text-y attributes
// > are offsets that specify where the baseline of the start
// > of the ending text appears, relative to the start of the
// > ending line.
//
// > The number attribute reflects the numeric values of what
// > is under the ending line. Single endings such as "1" or
// > comma-separated multiple endings such as "1, 2" may be
// > used. The ending element text is used when the text
// > displayed in the ending is different than what appears in
// > the number attribute. The print-object element is used to
// > indicate when an ending is present but not printed, as is
// > often the case for many parts in a full score.
//
// <!ELEMENT ending (#PCDATA)>
// <!ATTLIST ending
//    number CDATA #REQUIRED
//    type (start | stop | discontinue) #REQUIRED
//    %print-object;
//    %print-style;
//    end-length %tenths; #IMPLIED
//    text-x %tenths; #IMPLIED
//    text-y %tenths; #IMPLIED
// >
public struct Ending: Equatable {
    public enum Kind: String, Decodable {
        case start
        case stop
        case discontinue
    }
    let value: String // e.g., 1., 2.
    let number: [Int]
    let type: Kind
    let printObject: Bool?
    let printStyle: PrintStyle?
    let endLength: Int? // tenths
    let textX: Int? // tenths
    let textY: Int? // tenths
}

// > Repeat marks. The start of the repeat has a forward direction
// > while the end of the repeat has a backward direction. Backward
// > repeats that are not part of an ending can use the times
// > attribute to indicate the number of times the repeated section
// > is played. The winged attribute indicates whether the repeat
// > has winged extensions that appear above and below the barline.
// > The straight and curved values represent single wings, while
// > the double-straight and double-curved values represent double
// > wings. The none value indicates no wings and is the default.
//
// <!ELEMENT repeat EMPTY>
// <!ATTLIST repeat
//    direction (backward | forward) #REQUIRED
//    times CDATA #IMPLIED
//    winged (none | straight | curved |
//        double-straight | double-curved) #IMPLIED
// >
public struct Repeat: Decodable, Equatable {
    public enum Direction: String, Decodable {
        case backward
        case forward
    }
    public enum Winged: String, Decodable {
        case none
        case straight
        case curved
        case doubleString = "double-straight"
        case doubleCurved = "double-curved"
    }
    let direction: Direction
    let times: Int
    let winged: Winged
}

extension Ending: Decodable {
    enum CodingKeys: String, CodingKey {
        case value
        case number
        case type
        case printObject = "print-object"
        case printStyle = "print-style"
        case endLength = "end-length"
        case textX = "text-x"
        case textY = "text-y"
    }
}

extension Barline: Decodable {
    enum CodingKeys: String, CodingKey {
        case location
        case barStyle = "bar-style"
        case editorial
        case wavyLine = "wavy-line"
        case segno
        case coda
        case fermatas
        case ending
        case `repeat`
        case divisions
        case optionalUniqueID = "optional-unique-id"
    }
}
