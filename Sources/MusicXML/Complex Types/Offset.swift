//
//  Offset.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// An offset is represented in terms of divisions, and indicates where the direction will appear
/// relative to the current musical location. This affects the visual appearance of the direction.
/// If an element within a direction includes a default-x attribute, the offset value will be
/// ignored when determining the appearance of that element.
public struct Offset {

    // MARK: - Value

    public let value: Divisions

    // MARK: - Attributes

    public let sound: Bool?
}

extension Offset {

    // MARK: - Initializers

    public init(_ value: Divisions, sound: Bool? = nil) {
        self.value = value
        self.sound = sound
    }
}

extension Offset: Equatable { }
extension Offset: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case sound
    }
}
