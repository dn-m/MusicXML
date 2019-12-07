//
//  Rest.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The rest element indicates notated rests or silences. Rest elements are usually empty, but
/// placement on the staff can be specified using display-step and display-octave elements.
public struct Rest {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let measure: Bool?

    // MARK: Elements

    public let displayStep: Step?
    public let displayOctave: Int?

    // MARK: - Initializers

    public init(measure: Bool? = nil, displayStep: Step? = nil, displayOctave: Int? = nil) {
        self.measure = measure
        self.displayStep = displayStep
        self.displayOctave = displayOctave
    }
}

extension Rest: Equatable {}
extension Rest: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case measure
        case displayStep = "display-step"
        case displayOctave = "display-octave"
    }
}

import XMLCoder
extension Rest: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.measure:
            return .attribute
        default:
        return .element
        }
    }
}
