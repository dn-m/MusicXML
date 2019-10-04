//
//  Fermata.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The fermata text content represents the shape of the fermata sign. An empty fermata element
/// represents a normal fermata. The fermata type is upright if not specified.
public struct Fermata {

    // MARK: - Value

    public var value: FermataShape

    // MARK: - Attributes

    public var type: UprightInverted?
    public var printStyle: PrintStyle?

    public init(value: FermataShape, type: UprightInverted? = nil, printStyle: PrintStyle? = nil) {
        self.value = value
        self.type = type
        self.printStyle = printStyle
    }
}

extension Fermata: Equatable { }
extension Fermata: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case type
        case printStyle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(FermataShape.self, forKey: .value) ?? .normal
        self.type = try container.decodeIfPresent(UprightInverted.self, forKey: .type)
    }
}
