extension String {
    public func escape(_ kind: EscapeKind = .line) -> String {
        return EscapeKind.escape(self, kind: kind)
    }
}
