//
//  PedalTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The pedal-tuning type specifies the tuning of a single harp pedal.
public struct PedalTuning {
    // MARK: - Instance Properties

    public let step: Step
    public let alter: Int

    public init(step: Step, alter: Int) {
        self.step = step
        self.alter = alter
    }
}

extension PedalTuning: Equatable {}
extension PedalTuning: Codable {
    private enum CodingKeys: String, CodingKey {
        case step = "pedal-step"
        case alter = "pedal-alter"
    }
}
