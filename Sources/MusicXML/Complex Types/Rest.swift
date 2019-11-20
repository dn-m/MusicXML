//
//  Rest.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The rest element indicates notated rests or silences. Rest elements are usually empty, but
/// placement on the staff can be specified using display-step and display-octave elements.
public struct Rest {
    public let measure: Bool?

    public let displayStep: Step?
    public let displayOctave: Int?

    public init(measure: Bool? = nil, displayStep: Step? = nil, displayOctave: Int? = nil) {
        self.measure = measure
        self.displayStep = displayStep
        self.displayOctave = displayOctave
    }
}

extension Rest: Equatable {}
extension Rest: Codable {
    private enum CodingKeys: String, CodingKey {
        case measure
        case displayStep = "display-step"
        case displayOctave = "display-octave"
    }
}
