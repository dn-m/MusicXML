//
//  OnOff.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The on-off type is used for notation elements such as string mutes.
public enum OnOff: String {
    case on
    case off
}

extension OnOff: Equatable { }
extension OnOff: Decodable { }
