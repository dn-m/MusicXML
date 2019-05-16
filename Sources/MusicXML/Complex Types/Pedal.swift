//
//  Pedal.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The pedal type represents piano pedal marks. The change type indicates a pedal lift and retake
/// indicated with an inverted V marking. The continue type allows more precise formatting across
/// system breaks and for more complex pedaling lines. The alignment attributes are ignored if the
/// line attribute is yes.
public struct Pedal {
    public let type: StartStopContinue
    public let line: Bool?
    public let sign: Bool?
    public let printStyleAlign: PrintStyleAlign?
}

extension Pedal: Equatable { }
extension Pedal: Decodable { }
