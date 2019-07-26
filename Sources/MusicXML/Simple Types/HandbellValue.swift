//
//  HandbellValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The handbell-value type represents the type of handbell technique being notated.
public enum HandbellValue: String {
    case damp
    case echo
    case gyro
    case handMartellato = "hand martellato"
    case malletLift = "mallet lift"
    case malletTable = "mallet table"
    case martellato
    case martellatoLift = "martellato lift"
    case mutedMartellato = "muted martellato"
    case pluckLift = "pluck lift"
    case swing
}

extension HandbellValue: Equatable { }
extension HandbellValue: Codable { }
