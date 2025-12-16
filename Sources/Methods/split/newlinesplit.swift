import Foundation

extension String {
    public var newlinesplit: [String] {
        return self
        .components(separatedBy: .newlines)
    }
}
