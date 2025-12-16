extension String {
    public var emdashed: String {
        return self.replacingOccurrences(of: "--", with: "—")
    }
}
