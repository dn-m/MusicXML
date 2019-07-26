//
//  NonArpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The non-arpeggiate type indicates that this note is at the top or bottom of a bracket indicating
/// to not arpeggiate these notes. Since this does not involve playback, it is only used on the top
/// or bottom notes, not on each note as for the arpeggiate type.
public struct NonArpeggiate {
    public let type: TopBottom
    public let number: Int?
    public let position: Position?
    public let placement: AboveBelow?
    public let color: Color?
}

extension NonArpeggiate: Equatable { }
extension NonArpeggiate: Codable { }
