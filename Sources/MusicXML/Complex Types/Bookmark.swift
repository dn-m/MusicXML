//
//  Bookmark.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bookmark type serves as a well-defined target for an incoming simple XLink.
public struct Bookmark {
    public let id: String
    public let name: String?
    public let element: String?
    public let position: Int?

    public init(id: String, name: String? = nil, element: String? = nil, position: Int? = nil) {
        self.id = id
        self.name = name
        self.element = element
        self.position = position
    }
}

extension Bookmark: Equatable {}
extension Bookmark: Codable {}
