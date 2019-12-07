//
//  Unpitched.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The unpitched type represents musical elements that are notated on the staff but lack definite
/// pitch, such as unpitched percussion and speaking voice.
public struct Unpitched {
    // MARK: - Instance Properties

    // MARK: Elements

    public var displayStep: Step
    public var displayOctave: Int

    // MARK: - Initializers

    public init(displayStep: Step, displayOctave: Int) {
        self.displayStep = displayStep
        self.displayOctave = displayOctave
    }
}

extension Unpitched: Equatable {}
extension Unpitched: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case displayStep = "display-step"
        case displayOctave = "display-octave"
    }
}

import XMLCoder
extension Unpitched: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
