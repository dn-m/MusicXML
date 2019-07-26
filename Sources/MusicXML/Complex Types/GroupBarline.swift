//
//  GroupBarline.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The group-barline type indicates if the group should have common barlines.
public struct GroupBarline {
    let value: GroupBarlineValue
    let color: Color?
}

extension GroupBarline: Equatable { }
extension GroupBarline: Codable { }
