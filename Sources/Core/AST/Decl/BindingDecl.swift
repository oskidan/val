/// A binding declaration.
public struct BindingDecl: Decl {

  public let origin: SourceRange?

  /// The attributes of the declaration, if any.
  public let attributes: [SourceRepresentable<Attribute>]

  /// The access modifier of the declaration, if any.
  public let accessModifier: SourceRepresentable<AccessModifier>?

  /// The member modifier of the declaration.
  public let memberModifier: SourceRepresentable<MemberModifier>?

  /// The pattern of the declaration.
  public let pattern: NodeID<BindingPattern>

  /// The initializer of the declaration, if any.
  public let initializer: AnyExprID?

  /// Creates an instance with the given properties.
  public init(
    attributes: [SourceRepresentable<Attribute>] = [],
    accessModifier: SourceRepresentable<AccessModifier>? = nil,
    memberModifier: SourceRepresentable<MemberModifier>? = nil,
    pattern: NodeID<BindingPattern>,
    initializer: AnyExprID?,
    origin: SourceRange?
  ) {
    self.origin = origin
    self.attributes = attributes
    self.accessModifier = accessModifier
    self.memberModifier = memberModifier
    self.pattern = pattern
    self.initializer = initializer
  }

  /// Returns whether the declaration is public.
  public var isPublic: Bool { accessModifier?.value == .public }

  /// Returns whether the declaration denotes a static member.
  public var isStatic: Bool { memberModifier?.value == .static }

}
