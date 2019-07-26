//
//  MeasureStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A measure-style indicates a special way to print partial to multiple measures within a part.
/// This includes multiple rests over several measures, repeats of beats, single, or multiple
/// measures, and use of slash notation. The multiple-rest and measure-repeat symbols indicate the
/// number of measures covered in the element content. The beat-repeat and slash elements can cover
/// partial measures. All but the multiple-rest element use a type attribute to indicate starting
/// and stopping the use of the style.
public struct MeasureStyle {
    public let number: Int
    public let font: Font
    public let color: Color
    public let kind: Kind
}

extension MeasureStyle {

    public enum Kind {
        case beatRepeat(BeatRepeat)
        case measureRepeat(MeasureRepeat)
        case multipleRest(MultipleRest)
        case slash(Slash)
    }
}

extension MeasureStyle.Kind: Equatable { }
extension MeasureStyle.Kind: Codable {
    #warning("Implement MeasureStyle.Kind: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("MeasureStyle.Kind.init(from: Decoder) not yet implemented!")
    }
}

extension MeasureStyle: Equatable { }
extension MeasureStyle: Codable { }



