//
//  Attributes.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//  MusicXML attributes.mod module
//  Version 3.1
//
//  Copyright © 2004-2017 the Contributors to the MusicXML
//  Specification, published by the W3C Music Notation Community
//  Group under the W3C Community Final Specification Agreement
//  (FSA):
//
//     https://www.w3.org/community/about/agreements/final/
//
//  A human-readable summary is available:
//
//     https://www.w3.org/community/about/agreements/fsa-deed/
//
//  The attributes DTD module contains the attributes element
//  and its children, such as key and time signatures.

/// The attributes element contains musical information that typically changes on measure
/// boundaries. This includes key and time signatures, clefs, transpositions, and staving. When
/// attributes are changed mid-measure, it affects the music in score order, not in MusicXML
/// document order.
public struct Attributes {
    public var footnote: FormattedText?
    public var level: Level?
    public var divisions: Int?
    public var keys: [Key]?
    public var times: [Time]?
    public var staves: Int?
    public var partSymbol: PartSymbol?
    public var instruments: Int?
    public var clefs: [Clef]?
    public var staffDetails: [StaffDetails]?
    public var transpose: [Transpose]?
    public var measureStyles: [MeasureStyle]?
}

extension Attributes: Equatable { }
extension Attributes: Codable {
    enum CodingKeys: String, CodingKey {
        case footnote
        case level
        case divisions
        case keys = "key"
        case times = "time"
        case staves = "stave"
        case partSymbol = "part-symbol"
        case instruments
        case clefs = "clef"
        case staffDetails = "staff-details"
        case transpose
        case measureStyles = "measure-style"
    }

}
