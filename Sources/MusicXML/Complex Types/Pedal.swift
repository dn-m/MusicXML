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

    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let printStyleAlign: PrintStyleAlign

    // MARK: One-off Attributes

    public let type: StartStopChangeContinue
    public let line: Bool?
    public let sign: Bool?

    public init(
        type: StartStopChangeContinue,
        line: Bool? = nil,
        sign: Bool? = nil,
        printStyleAlign: PrintStyleAlign = PrintStyleAlign()
    ) {
        self.type = type
        self.line = line
        self.sign = sign
        self.printStyleAlign = printStyleAlign
    }
}

extension Pedal: Equatable { }
extension Pedal: Codable {
    public init(from decoder: Decoder) throws {
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StartStopChangeContinue.self, forKey: .type)
        self.line = try container.decodeIfPresent(Bool.self, forKey: .line)
        self.sign = try container.decodeIfPresent(Bool.self, forKey: .sign)
    }
}
