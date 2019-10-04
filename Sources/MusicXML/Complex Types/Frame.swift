//
//  Frame.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The frame type represents a frame or fretboard diagram used together with a chord symbol. The
/// representation is based on the NIFF guitar grid with additional information.
public struct Frame {
    public let position: Position?
    public let color: Color?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlignImage?
    public let height: Tenths?
    public let width: Tenths?
    /// The frame type's unplayed attribute indicates what to display above a string that has no
    /// associated frame-note element. Typical values are x and the empty string. If the attribute
    /// is not present, the display of the unplayed string is application-defined.
    public let unplayed: String

    /// The frame-strings element gives the overall size of the frame in vertical lines (strings).
    public let frameStrings: Int
    /// The frame-frets element gives the overall size of the frame in horizontal spaces (frets).
    public let frameFrets: Int
    /// The first-fret type indicates which fret is shown in the top space of the frame; it is fret
    /// 1 if the element is not present.
    public let firstFret: FirstFret?
    /// The frame-note type represents each note included in the frame. An open string will have a
    /// fret value of 0, while a muted string will not be associated with a frame-note element.
    public let frameNote: [FrameNote] // NonEmpty

    public init(position: Position? = nil, color: Color? = nil, hAlign: LeftCenterRight? = nil, vAlign: VAlignImage? = nil, height: Tenths? = nil, width: Tenths? = nil, unplayed: String, frameStrings: Int, frameFrets: Int, firstFret: FirstFret? = nil, frameNote: [FrameNote]) {
        self.position = position
        self.color = color
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.height = height
        self.width = width
        self.unplayed = unplayed
        self.frameStrings = frameStrings
        self.frameFrets = frameFrets
        self.firstFret = firstFret
        self.frameNote = frameNote
    }
}

extension Frame: Equatable { }
extension Frame: Codable { }
