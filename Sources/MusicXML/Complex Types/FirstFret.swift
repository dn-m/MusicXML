//
//  FirstFret.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The first-fret type indicates which fret is shown in the top space of the frame; it is fret 1 if
/// the element is not present.
public struct FirstFret {
    public let value: Int
    public let text: String?
    public let location: LeftRight?

    public init(_ value: Int, text: String? = nil, location: LeftRight? = nil) {
        self.value = value
        self.text = text
        self.location = location
    }
}

extension FirstFret: Equatable { }
extension FirstFret: Codable {
    enum CodingKeys: String, CodingKey {
        case text
        case location
        case value = ""
    }
}
