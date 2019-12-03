//
//  StaffTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The staff-tuning type specifies the open, non-capo tuning of the lines on a tablature staff.
public struct StaffTuning {
    // MARK: - Instance Properties

    public let line: Int?
    public let tuningStep: Step
    public let tuningAlter: Double?
    public let tuningOctave: Int

    // MARK - Initializers

    public init(line: Int? = nil, tuningStep: Step, tuningAlter: Double? = nil, tuningOctave: Int) {
        self.line = line
        self.tuningStep = tuningStep
        self.tuningAlter = tuningAlter
        self.tuningOctave = tuningOctave
    }
}

extension StaffTuning: Equatable {}
extension StaffTuning: Codable {}
