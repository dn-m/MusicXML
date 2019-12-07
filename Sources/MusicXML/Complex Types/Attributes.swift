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
    // MARK: - Instance Properties

    public let footnote: FormattedText?
    public let level: Level?
    public let divisions: Int?
    public let keys: [Key]?
    public let times: [Time]?
    public let staves: Int?
    public let partSymbol: PartSymbol?
    public let instruments: Int?
    public let clefs: [Clef]?
    public let staffDetails: [StaffDetails]?
    public let transpose: [Transpose]?
    public let measureStyles: [MeasureStyle]?

    // MARK: - Initializers

    public init(
        footnote: FormattedText? = nil,
        level: Level? = nil,
        divisions: Int? = nil,
        keys: [Key]? = nil,
        times: [Time]? = nil,
        staves: Int? = nil,
        partSymbol: PartSymbol? = nil,
        instruments: Int? = nil,
        clefs: [Clef]? = nil,
        staffDetails: [StaffDetails]? = nil,
        transpose: [Transpose]? = nil,
        measureStyles: [MeasureStyle]? = nil
    ) {
        self.footnote = footnote
        self.level = level
        self.divisions = divisions
        self.keys = keys
        self.times = times
        self.staves = staves
        self.partSymbol = partSymbol
        self.instruments = instruments
        self.clefs = clefs
        self.staffDetails = staffDetails
        self.transpose = transpose
        self.measureStyles = measureStyles
    }
}

extension Attributes: Equatable {}
extension Attributes: Codable {
    // MARK: - Codable

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

import XMLCoder
extension Attributes: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
