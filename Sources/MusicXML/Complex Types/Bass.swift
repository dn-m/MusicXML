//
//  Bass.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass type is used to indicate a bass note in popular music chord symbols, e.g. G/C. It is
/// generally not used in functional harmony, as inversion is generally not used in pop chord
/// symbols. As with root, it is divided into step and alter elements, similar to pitches.
public struct Bass {
    public let step: BassStep
    public let alter: BassAlter?

    public init(step: BassStep, alter: BassAlter? = nil) {
        self.step = step
        self.alter = alter
    }
}

extension Bass: Equatable {}

extension Bass: Codable {
    private enum CodingKeys: String, CodingKey {
        case step = "bass-step"
        case alter = "bass-alter"
    }
}
