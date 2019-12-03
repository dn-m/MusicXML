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
public struct Degree {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let printObject: Bool?

    // MARK: Elements

    public let value: DegreeValue
    public let alter: DegreeAlter
    public let type: DegreeType

    // MARK: - Initializers

    public init(
        _ value: DegreeValue,
        alter: DegreeAlter,
        type: DegreeType,
        printObject: Bool? = nil
    ) {
        self.value = value
        self.alter = alter
        self.type = type
        self.printObject = printObject
    }
}

extension Degree: Equatable {}

extension Degree: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case printObject = "print-object"
        case value = "degree-value"
        case type = "degree-type"
        case alter = "degree-alter"
    }
}
