//
//  GroupBarlineValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The group-barline-value type indicates if the group should have common barlines.
public enum GroupBarlineValue: String {
    case yes
    case no
    case mensurstrich = "Mensurstrich"
}

extension GroupBarlineValue: Equatable { }
extension GroupBarlineValue: Decodable { }
