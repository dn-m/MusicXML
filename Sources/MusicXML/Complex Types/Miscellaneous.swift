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
    // MARK: - Instance Properties

    public let fields: [MiscellaneousField]

    // MARK - Initializers

    public init(fields: [MiscellaneousField]) {
        self.fields = fields
    }
}

extension Miscellaneous: Equatable {}
extension Miscellaneous: Codable {
    enum CodingKeys: String, CodingKey {
        case fields = "miscellaneous-field"
    }
}
