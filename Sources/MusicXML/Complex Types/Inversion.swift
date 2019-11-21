//
//  Inversion.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The inversion type represents harmony inversions. The value is a number indicating which
/// inversion is used: 0 for root position, 1 for first inversion, etc.
public struct Inversion {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: Int

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    public init(_ value: Int, printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.printStyle = printStyle
    }
}

extension Inversion: Equatable {}
extension Inversion: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Int.self, forKey: .value)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

extension Inversion: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

import XMLCoder
extension Inversion: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
