//
//  StaffTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The staff-tuning type specifies the open, non-capo tuning of the lines on a tablature staff.
public struct StaffTuning {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let line: Int?

    // MARK: Elements

    public let tuningStep: Step
    public let tuningAlter: Double?
    public let tuningOctave: Int

    // MARK: - Initializers

    public init(line: Int? = nil, tuningStep: Step, tuningAlter: Double? = nil, tuningOctave: Int) {
        self.line = line
        self.tuningStep = tuningStep
        self.tuningAlter = tuningAlter
        self.tuningOctave = tuningOctave
    }
}

extension StaffTuning: Equatable {}
extension StaffTuning: Codable {}

import XMLCoder
extension StaffTuning: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.line:
            return .attribute
        default:
        return .element
        }
    }
}
