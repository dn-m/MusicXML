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
    public enum Kind: String, Decodable, Equatable {
        case odd
        case even
        case both
    }
}

extension PageMargins: Equatable { }
extension PageMargins: Decodable { }
