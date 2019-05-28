//
//  Backup.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The backup and forward elements are required to coordinate multiple voices in one part,
/// including music on multiple staves. The backup type is generally used to move between voices and
/// staves. Thus the backup element does not include voice or staff elements. Duration values should
/// always be positive, and should not cross measure boundaries or mid-measure changes in the
/// divisions value.
public struct Backup: Decodable, Equatable {
    public let duration: Int
    public let editorial: Editorial
}
