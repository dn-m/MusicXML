//
//  Stick.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The stick type represents pictograms where the material of the stick, mallet, or beater is
/// included.
public struct Stick {
    public let tip: TipDirection?
    public let stickType: StickType
    public let stickMaterial: StickMaterial
}

extension Stick: Equatable { }
extension Stick: Codable { }
