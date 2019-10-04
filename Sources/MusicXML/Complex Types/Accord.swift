//
//  Accord.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accord type represents the tuning of a single string in the scordatura element. It uses the
/// same group of elements as the staff-tuning element.
public struct Accord {
    public let string: Int // string-number (attribute)
    public let tuningStep: Step
    public let tuningAlter: Double? // semitones
    public let tuningOctave: Int? // octaves


    public init(string: Int, tuningStep: Step, tuningAlter: Double? = nil, tuningOctave: Int? = nil) {
        self.string = string
        self.tuningStep = tuningStep
        self.tuningAlter = tuningAlter
        self.tuningOctave = tuningOctave
    }
}

extension Accord: Equatable { }
extension Accord: Codable { }
