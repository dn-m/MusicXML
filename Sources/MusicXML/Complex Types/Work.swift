//
//  Work.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Works are optionally identified by number and title. The work type also may indicate a link to
/// the opus document that composes multiple scores into a collection.
public struct Work {
    public let number: String?
    public let title: String?
    public let opus: Opus?
}

extension Work: Equatable { }
extension Work: Codable { }
