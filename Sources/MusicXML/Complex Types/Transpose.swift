//
//  Transpose.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The transpose type represents what must be added to a written pitch to get a correct sounding
/// pitch.
public struct Transpose {
    // MARK: - Instance Properties

    // MAKR: Attributes

    /// The optional number attribute refers to staff numbers, from top to bottom on the system. If
    /// absent, the transposition applies to all staves in the part. Per-staff transposition is most
    /// often used in parts that represent multiple instruments.
    public let number: Int?

    // MARK: Elements

    /// The diatonic element specifies the number of pitch steps needed to go from written to
    /// sounding pitch. This allows for correct spelling of enharmonic transpositions.
    public let diatonic: Int?

    /// The chromatic element represents the number of semitones needed to get from written to
    /// sounding pitch. This value does not include octave-change values; the values for both
    /// elements need to be added to the written pitch to get the correct sounding pitch.
    public let chromatic: Int

    /// The octave-change element indicates how many octaves to add to get from written pitch to
    /// sounding pitch.
    public let octaveChange: Int?

    /// If the double element is present, it indicates that the music is doubled one octave down
    /// from what is currently written (as is the case for mixed cello / bass parts in orchestral
    /// literature).
    public let double: Bool?

    // MARK: - Initializers

    public init(number: Int? = nil, diatonic: Int? = nil, chromatic: Int, octaveChange: Int? = nil, double: Bool? = nil) {
        self.number = number
        self.diatonic = diatonic
        self.chromatic = chromatic
        self.octaveChange = octaveChange
        self.double = double
    }
}

extension Transpose: Equatable {}
extension Transpose: Codable {}

import XMLCoder
extension Transpose: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
