//
//  StaffDetails.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The staff-details element is used to indicate different types of staves. The print-object
/// attribute is used to indicate when a staff is not printed in a part, usually in large scores
/// where empty parts are omitted. It is yes by default. If print-spacing is yes while print-object
/// is no, the score is printed in cutaway format where vertical space is left for the empty part.
public struct StaffDetails {
    // MARK: - Instance Properties

    // MARK: Attributes

    /// The optional number attribute specifies the staff number from top to bottom on the system,
    /// as with clef.
    public let number: Int?

    /// Indicates whether to show fret numbers or fret letters. If not specified, numbers is used.
    public let showFrets: ShowFrets?

    public let printObject: Bool?
    public let printSpacing: Bool?

    // MARK: Elements

    /// The staff-type value can be ossia, cue, editorial, regular, or alternate. An alternate staff
    /// indicates one that shares the same musical data as the prior staff, but displayed
    /// differently (e.g., treble and bass clef, standard notation and tab).
    public let staffType: StaffType?

    /// The staff-lines element specifies the number of lines for a non 5-line staff.
    public let staffLines: Int?

    /// The staff-tuning type specifies the open, non-capo tuning of the lines on a tablature staff.
    public let staffTuning: [StaffTuning]

    /// The capo element indicates at which fret a capo should be placed on a fretted instrument.
    /// This changes the open tuning of the strings specified by staff-tuning by the specified
    /// number of half-steps.
    public let capo: Int?

    /// The staff-size element indicates how large a staff space is on this staff, expressed as a
    /// percentage of the work's default scaling. Values less than 100 make the staff space smaller
    /// while values over 100 make the staff space larger. A staff-type of cue, ossia, or editorial
    /// implies a staff-size of less than 100, but the exact value is implementation-dependent
    /// unless specified here. Staff size affects staff height only, not the relationship of the
    /// staff to the left and right margins.
    public let staffSize: Double?

    // MARK: - Initializers

    public init(number: Int? = nil, showFrets: ShowFrets? = nil, printObject: Bool? = nil, printSpacing: Bool? = nil, staffType: StaffType? = nil, staffLines: Int? = nil, staffTuning: [StaffTuning], capo: Int? = nil, staffSize: Double? = nil) {
        self.number = number
        self.showFrets = showFrets
        self.printObject = printObject
        self.printSpacing = printSpacing
        self.staffType = staffType
        self.staffLines = staffLines
        self.staffTuning = staffTuning
        self.capo = capo
        self.staffSize = staffSize
    }
}

extension StaffDetails: Equatable {}
extension StaffDetails: Codable {}

import XMLCoder
extension StaffDetails: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.showFrets:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.printSpacing:
            return .attribute
        default:
            return .element
        }
    }
}
