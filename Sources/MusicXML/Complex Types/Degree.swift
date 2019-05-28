//
//  Degree.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The degree type is used to add, alter, or subtract individual notes in the chord. The
/// print-object attribute can be used to keep the degree from printing separately when it has
/// already taken into account in the text attribute of the kind element. The degree-value and
/// degree-type text attributes specify how the value and type of the degree should be displayed. A
/// harmony of kind "other" can be spelled explicitly by using a series of degree elements together
/// with a root.
public struct Degree: Decodable, Equatable {
    public let value: DegreeValue
    public let alter: DegreeAlter
    public let type: DegreeType
    public let printObject: Bool
}

