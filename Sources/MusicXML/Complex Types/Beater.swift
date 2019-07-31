//
//  Beater.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Beater {
    public let value: BeaterValue
    public let tip: TipDirection?
}

extension Beater: Equatable { }
extension Beater: Codable { }
