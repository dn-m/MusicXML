//
//  MeasureAttributes.swift
//  MusicXML
//
//  Created by James Bean on 10/15/19.
//

/// The attributes which are shared between the `Timewise` and `Partwise` forms of `Measure`.
public struct MeasureAttributes {
    public let number: String
    public let text: String?
    public let implicit: Bool?
    public let nonControlling: Bool?
    public let width: Tenths?
    public let optionalUniqueID: Int?
}

extension MeasureAttributes: Equatable {}
extension MeasureAttributes: Hashable {}

extension MeasureAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case number
        case text
        case implicit
        case nonControlling = "non-controlling"
        case width
        case optionalUniqueID = "optional-unique-id"
    }
}
