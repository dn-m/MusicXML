//
//  NameDisplay.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The name-display type is used for exact formatting of multi-font text in part and group names to
/// the left of the system. The print-object attribute can be used to determine what, if anything,
/// is printed at the start of each system. Enclosure for the display-text element is none by
/// default. Language for the display-text element is Italian ("it") by default.
public struct NameDisplay {
    public let printObject: Bool
    public let text: Text
}

extension NameDisplay {
    public enum Text {
        case accidental(AccidentalText)
        case display(FormattedText)
    }
}

extension NameDisplay.Text: Equatable { }

extension NameDisplay.Text: Codable {
    #warning("TODO: Implement NameDisplay.Text: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("NameDisplay.Text.init(from: Decoder) not yet implemented!")
    }
}

extension NameDisplay: Equatable { }
extension NameDisplay: Codable { }
