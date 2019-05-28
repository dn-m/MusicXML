//
//  PageLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// Page layout can be defined both in score-wide defaults and in the print element. Page margins
/// are specified either for both even and odd pages, or via separate odd and even page number
/// values. The type is not needed when used as part of a print element. If omitted when used in the
/// defaults element, "both" is the default.
public struct PageLayout {
    public let size: Size?
    public let margins: [Margins]
}

extension PageLayout {

    public struct Size: Decodable, Equatable {
        let height: Tenths
        let width: Tenths
    }

    #warning("FIXME: Refactor Margins a little better to encode logic")
    public struct Margins: Decodable, Equatable {
        let even: PageMargins
        let odd: PageMargins?
    }
}

extension PageLayout: Equatable { }
extension PageLayout: Decodable { }
