//
//  Miscellaneous.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// If a program has other metadata not yet supported in the MusicXML format, it can go in the
/// miscellaneous element. The miscellaneous type puts each separate part of metadata into its own
/// miscellaneous-field type.
public struct Miscellaneous {
    public let miscellaneousFields: [MiscellaneousField]
}

extension Miscellaneous: Equatable { }
extension Miscellaneous: Decodable { }
