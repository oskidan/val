import Utils

extension Diagnostic {

  static func error(
    illegalGlobalBindingIntroducer i: SourceRepresentable<BindingPattern.Introducer>
  ) -> Diagnostic {
    .error(
      "global binding must be introduced by 'let'",
      range: i.origin)
  }

  static func error(
    illegalMemberBindingIntroducer i: SourceRepresentable<BindingPattern.Introducer>
  ) -> Diagnostic {
    .error(
      "member binding must be introduced by 'let' or 'var'",
      range: i.origin)
  }

  static func error(
    invalidOperatorLabels found: [String?],
    expected: [String?],
    at range: SourceRange?
  ) -> Diagnostic {
    .error(
      """
      invalid operator labels '\(Name.describe(labels: found))', \
      expected '\(Name.describe(labels: found))'
      """,
      range: range)
  }

  static func error(
    invalidOperatorNotation found: OperatorNotation,
    expected: OperatorNotation,
    at range: SourceRange?
  ) -> Diagnostic {
    .error(
      "invalid operator notation '\(found)', expected '\(expected)'",
      range: range)
  }

  static func error(
    missingFunctionIdentifier d: FunctionDecl
  ) -> Diagnostic {
    .error(
      "missing identifier in function declaration",
      range: d.introducerRange)
  }

  static func error(
    missingMethodIdentifier d: MethodDecl
  ) -> Diagnostic {
    error(missingMethodIdentifierAt: d.introducerRange)
  }

  static func error(
    missingMethodIdentifierAt range: SourceRange?
  ) -> Diagnostic {
    .error(
      "missing identifier in method bundle declaration",
      range: range)
  }

  static func error(
    missingSubscriptIdentifier d: SubscriptDecl
  ) -> Diagnostic {
    .error(
      "missing identifier in subscript declaration",
      range: d.introducer.origin)
  }

  static func error(
    missingTypeAnnotation p: BindingPattern,
    in ast: AST
  ) -> Diagnostic {
    .error(
      "missing type annotation",
      range: ast[p.subpattern].origin)
  }

  static func error(
    missingTypeAnnotation p: ParameterDecl,
    in ast: AST
  ) -> Diagnostic {
    .error(
      "missing type annotation",
      range: p.identifier.origin)
  }

  static func error(
    unexpectedAssociatedTypeDecl d: AssociatedTypeDecl
  ) -> Diagnostic {
    .error(
      "associated type declaration is not allowed here",
      range: d.introducerRange)
  }

  static func error(
    unexpectedAssociatedValueDecl d: AssociatedValueDecl
  ) -> Diagnostic {
    .error(
      "associated value declaration is not allowed here",
      range: d.introducerRange)
  }

  public static func error(
    unexpectedCapture p: BindingPattern
  ) -> Diagnostic {
    .error(
      "explicit capture is not allowed here",
      range: p.introducer.origin)
  }

  static func error(
    unexpectedImportDecl d: ImportDecl
  ) -> Diagnostic {
    .error(
      "import declaration is not allowed here",
      range: d.introducerRange)
  }

  static func error(
    unexpectedGenericParameterDecl d: GenericParameterDecl
  ) -> Diagnostic {
    .error(
      "generic parameter declaration is not allowed here",
      range: d.identifier.origin)
  }

  static func error(
    unexpectedInitializerDecl d: InitializerDecl
  ) -> Diagnostic {
    .error(
      "initializer declaration is not allowed here",
      range: d.introducer.origin)
  }

  static func error(
    unexpectedMemberModifier m: SourceRepresentable<MemberModifier>
  ) -> Diagnostic {
    .error(
      "unexpected member modifier '\(m.value)'",
      range: m.origin)
  }

  static func error(
    unexpectedMethodDecl d: MethodDecl
  ) -> Diagnostic {
    .error(
      "method bundle declaration is not allowed here",
      range: d.introducerRange)
  }

  static func error(
    unexpectedMethodImplDecl d: MethodImplDecl
  ) -> Diagnostic {
    .error(
      "method implementation declaration is not allowed here",
      range: d.introducer.origin)
  }

  static func error(
    unexpectedNamespaceDecl d: NamespaceDecl
  ) -> Diagnostic {
    .error(
      "namespace declaration is not allowed here",
      range: d.introducerRange)
  }

  static func error(
    unexpectedOperatorDecl d: OperatorDecl
  ) -> Diagnostic {
    .error(
      "operator declaration is not allowed here",
      range: d.introducerRange)
  }

  static func error(
    unexpectedParameterDecl d: ParameterDecl
  ) -> Diagnostic {
    .error(
      "parameter declaration is not allowed here",
      range: d.identifier.origin)
  }

  static func error(
    unexpectedPropertyDecl d: SubscriptDecl
  ) -> Diagnostic {
    .error(
      "property declaration is not allowed here",
      range: d.introducer.origin)
  }

  static func error(
    unexpectedSubscriptImplDecl d: SubscriptImplDecl
  ) -> Diagnostic {
    .error(
      "subscript implementation declaration is not allowed here",
      range: d.introducer.origin)
  }

  static func error(
    unexpectedTraitDecl d: TraitDecl
  ) -> Diagnostic {
    .error(
      "trait declaration is not allowed here",
      range: d.identifier.origin)
  }

  static func error(
    unexpectedVarDecl d: VarDecl
  ) -> Diagnostic {
    .error(
      "variable declaration is not allowed here",
      range: d.identifier.origin)
  }

}
