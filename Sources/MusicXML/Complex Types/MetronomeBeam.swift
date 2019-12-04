//
//  MetronomeBeam.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-beam type works like the beam type in defining metric relationships, but does not
/// include all the attributes available in the beam type.
public struct MetronomeBeam {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let number: BeamLevel?

    // MARK: Value

    public let value: BeamValue

    // MARK: - Initializers

    public init(_ value: BeamValue, number: BeamLevel? = nil) {
        self.value = value
        self.number = number
    }
}

extension MetronomeBeam: Equatable {}
extension MetronomeBeam: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case number
        case value = ""
    }
}

import XMLCoder
extension MetronomeBeam: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
