//
//  Fermata.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The fermata text content represents the shape of the fermata sign. An empty fermata element
/// represents a normal fermata. The fermata type is upright if not specified.
public struct Fermata {
    // MARK: - Instance Properties

    // MARK: Value

    public var value: FermataShape

    // MARK: Attributes

    public var type: UprightInverted?
    public var printStyle: PrintStyle

    // MARK - Initializers

    public init(_ value: FermataShape, type: UprightInverted? = nil, printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.type = type
        self.printStyle = printStyle
    }
}

extension Fermata: Equatable {}
extension Fermata: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case type
    }

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(FermataShape.self, forKey: .value) ?? .normal
        self.type = try container.decodeIfPresent(UprightInverted.self, forKey: .type)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

import XMLCoder
extension Fermata: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
