//
//  PedalTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The pedal-tuning type specifies the tuning of a single harp pedal.
public struct PedalTuning {
    public let pedalStep: Step
    public let pedalAlter: Int

    public init(pedalStep: Step, pedalAlter: Int) {
        self.pedalStep = pedalStep
        self.pedalAlter = pedalAlter
    }
}

extension PedalTuning: Equatable { }
extension PedalTuning: Codable { }
