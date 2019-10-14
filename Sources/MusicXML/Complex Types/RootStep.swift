//
//  RootStep.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The root-step type represents the pitch step of the root of the current chord within the harmony
/// element.
public struct RootStep {
    public let value: Step
    public let text: String?
    public let printStyle: PrintStyle

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

extension RootStep: Equatable { }
extension RootStep: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Step.self, forKey: .value)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.printStyle = try PrintStyle(from: decoder)
    }
}
