//
//  SystemMargins.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// System margins are relative to the page margins. Positive values indent and negative values
/// reduce the margin size.
public struct SystemMargins {
    // MARK: - Instance Properties

    public let left: Tenths
    public let right: Tenths

    public init(left: Tenths, right: Tenths) {
        self.left = left
        self.right = right
    }
}

extension SystemMargins: Equatable {}
extension SystemMargins: Codable {
    private enum CodingKeys: String, CodingKey {
        case left = "left-margin"
        case right = "right-margin"
    }
}
