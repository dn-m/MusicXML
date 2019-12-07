//
//  Pitch.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Pitch is represented as a combination of the step of the diatonic scale, the chromatic
/// alteration, and the octave.
public struct Pitch {
    // MARK: - Instance Properties

    // MARK: Elements

    public let step: Step
    public let alter: Double?
    public let octave: Int

    // MARK: - Initializers

    public init(step: Step, alter: Double? = nil, octave: Int) {
        self.step = step
        self.alter = alter
        self.octave = octave
    }
}

extension Pitch: Equatable {}
extension Pitch: Codable {}

import XMLCoder
extension Pitch: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
