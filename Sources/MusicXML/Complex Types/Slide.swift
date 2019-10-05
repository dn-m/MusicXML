//
//  Slide.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Glissando and slide types both indicate rapidly moving from one pitch to the other so that
/// individual notes are not discerned. The distinction is similar to that between NIFF's glissando
/// and portamento elements. A slide is continuous between two notes and defaults to a solid line.
/// The optional text for a is printed alongside the line.
public struct Slide {
    public let value: String
    public let type: StartStop
    public let number: Int?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let printStyle: PrintStyle?
    public let bendSound: BendSound?

    public init(value: String, type: StartStop, number: Int? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting? = nil, printStyle: PrintStyle? = nil, bendSound: BendSound? = nil) {
        self.value = value
        self.type = type
        self.number = number
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.printStyle = printStyle
        self.bendSound = bendSound
    }
}

extension Slide: Equatable { }
extension Slide: Codable { }
