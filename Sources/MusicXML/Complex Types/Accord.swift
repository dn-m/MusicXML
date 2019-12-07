//
//  Accord.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accord type represents the tuning of a single string in the scordatura element. It uses the
/// same group of elements as the staff-tuning element.
public struct Accord {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let string: Int

    // MARK: Elements

    public let tuningStep: Step
    public let tuningAlter: Double?
    public let tuningOctave: Int?

    // MARK: - Initializers

    public init(
        string: Int,
        tuningStep: Step,
        tuningAlter: Double? = nil,
        tuningOctave: Int? = nil
    ) {
        self.string = string
        self.tuningStep = tuningStep
        self.tuningAlter = tuningAlter
        self.tuningOctave = tuningOctave
    }
}

extension Accord: Equatable {}
extension Accord: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case string
        case tuningStep = "tuning-step"
        case tuningAlter = "tuning-alter"
        case tuningOctave = "tuning-octave"
    }
}

import XMLCoder
extension Accord: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.string:
            return .attribute
        default:
        return .element
        }
    }
}
