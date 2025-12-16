extension String {
    public func removepattern(_ pattern: String) -> String {
        return self
        .replacingOccurrences(
            of: pattern,
            with: "",
            options: .regularExpression
        )
    }
}
