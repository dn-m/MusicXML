//
//  Supports.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The supports type indicates if a MusicXML encoding supports a particular MusicXML element. This
/// is recommended for elements like beam, stem, and accidental, where the absence of an element is
/// ambiguous if you do not know if the encoding supports that element. For Version 2.0, the
/// supports element is expanded to allow programs to indicate support for particular attributes or
/// particular values. This lets applications communicate, for example, that all system and/or page
/// breaks are contained in the MusicXML file.
public struct Supports {
    public let type: Bool
    public let element: String
    public let attribute: String?
    public let value: String?

    public init(type: Bool, element: String, attribute: String? = nil, value: String? = nil) {
        self.type = type
        self.element = element
        self.attribute = attribute
        self.value = value
    }
}

extension Supports: Equatable { }
extension Supports: Codable { }
