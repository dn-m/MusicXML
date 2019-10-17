//
//  PageMargins.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Page margins are specified either for both even and odd pages, or via separate odd and even page
/// number values.
public struct PageMargins {
    public let type: Kind
    public let left: Tenths
    public let right: Tenths
    public let top: Tenths
    public let bottom: Tenths

    public init(type: Kind, left: Tenths, right: Tenths, top: Tenths, bottom: Tenths) {
        self.type = type
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
    }
}

extension PageMargins {
    public enum Kind: String {
        case odd
        case even
        case both
    }
}

extension PageMargins.Kind: Equatable { }
extension PageMargins.Kind: Codable { }

extension PageMargins: Equatable { }
extension PageMargins: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case left = "left-margin"
        case right = "right-margin"
        case top = "top-margin"
        case bottom = "bottom-margin"
    }
}
