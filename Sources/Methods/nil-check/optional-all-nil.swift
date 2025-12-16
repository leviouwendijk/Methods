extension Optional {
    public var isNil: Bool { self == nil }
    public var isNotNil: Bool { self != nil }

    public var notNil: Bool { self.isNotNil }
}
