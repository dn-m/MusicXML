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

    public init(size: Size? = nil, margins: [Margins]) {
        self.size = size
        self.margins = margins
    }
}

extension PageLayout {

    public struct Size: Codable, Equatable {
        let height: Tenths
        let width: Tenths

        public init(height: Tenths, width: Tenths) {
            self.height = height
            self.width = width
        }
    }

    #warning("FIXME: Refactor Margins a little better to encode logic")
    public struct Margins: Codable, Equatable {
        let even: PageMargins
        let odd: PageMargins?

        public init(even: PageMargins, odd: PageMargins? = nil) {
            self.even = even
            self.odd = odd
        }
    }
}

extension PageLayout: Equatable { }
extension PageLayout: Codable { }
