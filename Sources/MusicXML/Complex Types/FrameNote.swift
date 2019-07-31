//
//  FrameNote.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The frame-note type represents each note included in the frame. An open string will have a fret
/// value of 0, while a muted string will not be associated with a frame-note element.
public struct FrameNote {
    public let string: MusicXML.String
    public let fret: Fret
    public let fingering: Fingering?
    public let barre: Barre?
}

extension FrameNote: Equatable { }
extension FrameNote: Codable { }
