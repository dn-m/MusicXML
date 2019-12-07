//
//  PedalTuning.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The pedal-tuning type specifies the tuning of a single harp pedal.
public struct PedalTuning {
    // MARK: - Instance Properties

    // MARK: Elements

    public let step: Step
    public let alter: Int

    // MARK: - Initializers

    public init(step: Step, alter: Int) {
        self.step = step
        self.alter = alter
    }
}

extension PedalTuning: Equatable {}
extension PedalTuning: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case step = "pedal-step"
        case alter = "pedal-alter"
    }
}

import XMLCoder
extension PedalTuning: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
