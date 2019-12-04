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
    // MARK: - Instance Properties

    // MARK: Elements

    public let height: Double?
    public let width: Double?
    public let margins: [PageMargins]

    // MARK: - Initializers

    public init(height: Double? = nil, width: Double? = nil, margins: [PageMargins] = []) {
        self.height = height
        self.width = width
        self.margins = margins
    }
}

extension PageLayout: Equatable {}
extension PageLayout: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case height = "page-height"
        case width = "page-width"
        case margins = "page-margins"
    }
}
