//
//  Glissando.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Glissando and slide types both indicate rapidly moving from one pitch to the other so that
/// individual notes are not discerned. The distinction is similar to that between NIFF's glissando
/// and portamento elements. A glissando sounds the half notes in between the slide and defaults to
/// a wavy line. The optional text is printed alongside the line.
public struct Glissando {
    public let value: String
    public let type: StartStop
    public let number: Int?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let printStyle: PrintStyle?
}

extension Glissando: Equatable { }
extension Glissando: Decodable { }
