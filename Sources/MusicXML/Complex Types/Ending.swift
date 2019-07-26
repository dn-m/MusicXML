//
//  Ending.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The ending type represents multiple (e.g. first and second) endings. Typically, the start type
/// is associated with the left barline of the first measure in an ending. The stop and discontinue
/// types are associated with the right barline of the last measure in an ending. Stop is used when
/// the ending mark concludes with a downward jog, as is typical for first endings. Discontinue is
/// used when there is no downward jog, as is typical for second endings that do not conclude a
/// piece. The text-x and text-y attributes are offsets that specify where the baseline of the start
/// of the ending text appears, relative to the start of the ending line. The ending element text is
/// used when the text displayed in the ending is different than what appears in the number
/// attribute. The print-object element is used to indicate when an ending is present but not
/// printed, as is often the case for many parts in a full score.
public struct Ending {
    public let value: EndingNumber // e.g., 1., 2.
    public let number: [Int]
    public let type: StartStopContinue
    public let printObject: Bool?
    public let printStyle: PrintStyle?
    public let endLength: Tenths?
    public let textX: Tenths?
    public let textY: Tenths?
}

extension Ending: Equatable { }
extension Ending: Codable { }

//extension Ending: Codable {
//    enum CodingKeys: String, CodingKey {
//        case value
//        case number
//        case type
//        case printObject = "print-object"
//        case printStyle = "print-style"
//        case endLength = "end-length"
//        case textX = "text-x"
//        case textY = "text-y"
//    }
//}
