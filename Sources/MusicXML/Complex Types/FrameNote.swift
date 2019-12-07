//
//  FrameNote.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The frame-note type represents each note included in the frame. An open string will have a fret
/// value of 0, while a muted string will not be associated with a frame-note element.
public struct FrameNote {
    // MARK: - Instance Properties

    // MARK: Elements

    public let string: MusicXML.String
    public let fret: Fret
    public let fingering: Fingering?
    public let barre: Barre?

    // MARK: - Initializers

    public init(
        string: MusicXML.String,
        fret: Fret,
        fingering: Fingering? = nil,
        barre: Barre? = nil
    ) {
        self.string = string
        self.fret = fret
        self.fingering = fingering
        self.barre = barre
    }
}

extension FrameNote: Equatable {}
extension FrameNote: Codable {}

import XMLCoder
extension FrameNote: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
