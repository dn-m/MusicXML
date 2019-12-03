//
//  Ending.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The ending type represents multiple (e.g. first and second) endings. Typically, the start type
/// is associated with the left barline of the first measure in an ending. The stop and discontinue
/// types are associated with the right barline of the last measure in an ending. Stop is used when
/// the ending mark concludes with a downward jog, as is typical for first endings. Discontinue is
/// used when there is no downward jog, as is typical for second endings that do not conclude a
/// piece. The text-x and text-y attributes are offsets that specify where the baseline of the start
/// of the ending text appears, relative to the start of the ending line. The ending element text is
/// used when the text displayed in the ending is different than what appears in the number
/// attribute. The print-object element is used to indicate when an ending is present but not
/// printed, as is often the case for many parts in a full score.
public struct Ending {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String // e.g., 1., 2.

    // MARK: Attributes

    /// The number attribute reflects the numeric values of what is under the ending line. Single
    /// endings such as "1" or comma-separated multiple endings such as "1,2" may be used.
    public let number: String
    public let type: StartStopDiscontinue
    public let printObject: Bool?
    public let endLength: Tenths?
    public let textX: Tenths?
    public let textY: Tenths?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: String = "",
        number: String,
        type: StartStopDiscontinue,
        printObject: Bool? = nil,
        endLength: Tenths? = nil,
        textX: Tenths? = nil,
        textY: Tenths? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.number = number
        self.type = type
        self.printObject = printObject
        self.endLength = endLength
        self.textX = textX
        self.textY = textY
        self.printStyle = printStyle
    }
}

extension Ending: Equatable {}
extension Ending: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case number
        case type
        case printObject = "print-object"
        case endLength = "end-length"
        case textX = "text-x"
        case textY = "text-y"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(String.self, forKey: .number)
        self.type = try container.decode(StartStopDiscontinue.self, forKey: .type)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.endLength = try container.decodeIfPresent(Tenths.self, forKey: .endLength)
        self.textX = try container.decodeIfPresent(Tenths.self, forKey: .textX)
        self.textY = try container.decodeIfPresent(Tenths.self, forKey: .textY)
        // Decode value
        self.value = try container.decode(String.self, forKey: .value)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(number, forKey: .number)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try container.encodeIfPresent(endLength, forKey: .endLength)
        try container.encodeIfPresent(textX, forKey: .textX)
        try container.encodeIfPresent(textY, forKey: .textY)
        try printStyle.encode(to: encoder)
    }
}

import XMLCoder

extension Ending: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
