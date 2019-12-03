//
//  MeasureNumbering.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The measure-numbering type describes how frequently measure numbers are displayed on this part.
/// The number attribute from the measure element is used for printing.
public struct MeasureNumbering {
    // MARK: - Instance Properties

    public let value: MeasureNumberingValue
    public let printStyleAlign: PrintStyleAlign

    // MARK - Initializers

    public init(
        _ value: MeasureNumberingValue,
        printStyleAlign: PrintStyleAlign = PrintStyleAlign()
    ) {
        self.value = value
        self.printStyleAlign = printStyleAlign
    }
}

extension MeasureNumbering: Equatable {}
extension MeasureNumbering: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(MeasureNumberingValue.self, forKey: .value)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        try printStyleAlign.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

import XMLCoder

extension MeasureNumbering: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
