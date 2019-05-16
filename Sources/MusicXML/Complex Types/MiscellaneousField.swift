//
//  MiscellaneousField.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// If a program has other metadata not yet supported in the MusicXML format, each type of metadata
/// can go in a miscellaneous-field element. The required name attribute indicates the type of
/// metadata the element content represents.
public struct MiscellaneousField {
    public let name: String
}

extension MiscellaneousField: Equatable { }
extension MiscellaneousField: Decodable { }
