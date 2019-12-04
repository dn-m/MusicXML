//
//  BassStep.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass-step type represents the pitch step of the bass of the current chord within the harmony
/// element. In some chord styles, the text for the bass-step element may include bass-alter
/// information. In that case, the print-object attribute of the bass-alter element can be set to
/// no.
public struct BassStep {
    // MARK: - Instance Properties

    // MARK: Attributes

    /// The text attribute indicates how the bass should appear in a score if not using the element
    /// contents.
    public let text: String?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Value

    public let value: Step

    // MARK: - Initializers

    public init(_ value: Step, text: String? = nil, printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.text = text
        self.printStyle = printStyle
    }
}

extension BassStep {
    // MARK: - Type Properties

    public static let a = BassStep(.a)
    public static let b = BassStep(.b)
    public static let c = BassStep(.c)
    public static let d = BassStep(.d)
    public static let e = BassStep(.e)
    public static let f = BassStep(.f)
    public static let g = BassStep(.g)
}

extension BassStep: Equatable {}
extension BassStep: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case value = ""
        case text
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Step.self, forKey: .value)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

import XMLCoder
extension BassStep: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
