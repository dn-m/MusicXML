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
}

extension Fermata: Equatable { }
extension Fermata: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case type
        case printStyle
    }
}
