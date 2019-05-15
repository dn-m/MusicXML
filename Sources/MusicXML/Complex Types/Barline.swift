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

/// If a barline is other than a normal single barline, it should be represented by a barline type
/// that describes it. This includes information about repeats and multiple endings, as well as line
/// style. Barline data is on the same level as the other musical data in a score - a child of a
/// measure in a partwise score, or a part in a timewise score. This allows for barlines within
/// measures, as in dotted barlines that subdivide measures in complex meters. The two fermata
/// elements allow for fermatas on both sides of the barline (the lower one inverted). If no
/// location is specified, the right barline is the default.
public struct Barline {

//    public struct Fermatas: Decodable, Equatable {
//        let above: Fermata?
//        let below: Fermata?
//    }
//
//    public enum Location: String, Decodable, Equatable {
//        case right
//        case left
//        case middle
//    }
//
    /// Barlines have a location attribute to make it easier to process barlines independently of
    /// the other musical data in a score. It is often easier to set up measures separately from
    /// entering notes. The location attribute must match where the barline element occurs within
    /// the rest of the musical data in the score. If location is left, it should be the first
    /// element in the measure, aside from the print, bookmark, and link elements. If location is
    /// right, it should be the last element, again with the possible exception of the print,
    /// bookmark, and link elements.
    public let location: RightLeftMiddle?

    /// The segno attribute works the same way as the one in the sound element. It is used for
    /// playback when barline elements contain a segno element.
    public let segno: EmptyPrintStyleAlign?

    /// The coda attribute works the same way as the one in the sound element. It is used for
    /// playback when a barline element contains a coda child element.
    public let coda: EmptyPrintStyleAlign?

    /// The divisions attribute works the same way as the one in the sound element. It is used for
    /// playback when a barline element contains a divisions element.
    public let divisions: Int?

    /// The bar-style type represents barline style information. Choices are regular, dotted,
    /// dashed, heavy, light-light, light-heavy, heavy-light, heavy-heavy, tick (a short stroke
    /// through the top line), short (a partial barline between the 2nd and 4th lines), and none.
    public let barStyle: BarStyleColor?

    public let editorial: Editorial?
    public let wavyLine: WavyLine?
    public let fermata: Fermata
    public let ending: Ending?
    public let `repeat`: Repeat?
}

//extension Barline: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case location
//        case barStyle = "bar-style"
//        case editorial
//        case wavyLine = "wavy-line"
//        case segno
//        case coda
//        case fermatas
//        case ending
//        case `repeat`
//        case divisions
//        case optionalUniqueID = "optional-unique-id"
//    }
//}

extension Barline: Equatable { }
extension Barline: Decodable { }
