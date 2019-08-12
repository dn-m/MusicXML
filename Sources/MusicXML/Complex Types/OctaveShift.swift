//
//  OctaveShift.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The octave shift type indicates where notes are shifted up or down from their true pitched
/// values because of printing difficulty. Thus a treble clef line noted with 8va will be indicated
/// with an octave-shift down from the pitch data indicated in the notes. A size of 8 indicates one
/// octave; a size of 15 indicates two octaves.
public struct OctaveShift {
    public var type: UpDownStopContinue
    public var number: Int?
    public var size: Int?
    public var dashedFormatting: DashedFormatting?
    public var printStyle: PrintStyle?
}

extension OctaveShift: Equatable { }
extension OctaveShift: Codable { }
