//
//  PageMargins.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Page margins are specified either for both even and odd pages, or via separate odd and even page
/// number values.
public struct PageMargins {
    public let kind: Kind
    public let left: Tenths
    public let right: Tenths
    public let top: Tenths
    public let bottom: Tenths
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
extension PageMargins: Codable { }
