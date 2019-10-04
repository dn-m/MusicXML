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
    public let type: StartStopContinue
    public let number: Int?
    public let size: Int?
    public let dashedFormatting: DashedFormatting?
    public let printStyle: PrintStyle?

    public init(type: StartStopContinue, number: Int? = nil, size: Int? = nil, dashedFormatting: DashedFormatting? = nil, printStyle: PrintStyle? = nil) {
        self.type = type
        self.number = number
        self.size = size
        self.dashedFormatting = dashedFormatting
        self.printStyle = printStyle
    }
}

extension OctaveShift: Equatable { }
extension OctaveShift: Codable { }
