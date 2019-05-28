//
//  Fingering.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Fingering is typically indicated 1,2,3,4,5. Multiple fingerings may be given, typically to
/// substitute fingerings in the middle of a note. For guitar and other fretted instruments, the
/// fingering element represents the fretting finger; the pluck element represents the plucking
/// finger.
public struct Fingering {
    public let substitution: Bool
    public let alternate: Bool
    public let printStyle: PrintStyle
    public let placement: AboveBelow
}

extension Fingering: Equatable { }
extension Fingering: Decodable { }
