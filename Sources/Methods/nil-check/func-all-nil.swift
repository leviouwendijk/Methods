public func all_nil(_ values: [Any?]) -> Bool {
    return values.compactMap { $0 }.isEmpty
}
