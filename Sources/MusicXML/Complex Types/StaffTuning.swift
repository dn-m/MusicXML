//
//  StaffTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The staff-tuning type specifies the open, non-capo tuning of the lines on a tablature staff.
public struct StaffTuning {
    public let line: Int?
    public let tuningStep: Step
    public let tuningAlter: Double?
    public let tuningOctave: Int

}

extension StaffTuning: Equatable { }
extension StaffTuning: Decodable { }
