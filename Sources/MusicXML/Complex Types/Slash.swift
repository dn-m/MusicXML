//
//  Slash.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The slash type is used to indicate that slash notation is to be used.
public struct Slash {
    let type: StartStop
    let useDots: Bool
    let useStems: Bool
}

extension Slash: Equatable { }
extension Slash: Decodable { }
