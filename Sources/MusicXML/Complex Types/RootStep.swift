//
//  RootStep.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The root-step type represents the pitch step of the root of the current chord within the harmony
/// element.
public struct RootStep {
    // MARK: - Instance Properties

    public let value: Step
    public let text: String?
    public let printStyle: PrintStyle

    // MARK - Initializers

    public init(
        _ value: Step,
        text: String? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.text = text
        self.printStyle = printStyle
    }
}

extension RootStep {
    // MARK: - Type Properties

    public static let a = RootStep(.a)
    public static let b = RootStep(.b)
    public static let c = RootStep(.c)
    public static let d = RootStep(.d)
    public static let e = RootStep(.e)
    public static let f = RootStep(.f)
    public static let g = RootStep(.g)
}

extension RootStep: Equatable {}
extension RootStep: Codable {
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
extension RootStep: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
