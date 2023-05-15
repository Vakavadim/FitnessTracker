// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable all

internal enum L10n {
  /// Second test
  internal static let secondTitle = L10n.tr("Localizable", "secondTitle")
  /// TestTitle
  internal static let title = L10n.tr("Localizable", "title")

  internal enum CalendarView {
    /// S M T W T F S
    internal static let weekDays = L10n.tr("Localizable", "CalendarView.WeekDays")
  }
}

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
// swiftlint:enable all