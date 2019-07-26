//
//  Fermata.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The fermata text content represents the shape of the fermata sign. An empty fermata element
/// represents a normal fermata. The fermata type is upright if not specified.
public struct Fermata {
    public let shape: FermataShape = .normal
    public let type: UprightInverted = .upright
    public let printStyle: PrintStyle
}

extension Fermata: Equatable { }
extension Fermata: Codable { }
