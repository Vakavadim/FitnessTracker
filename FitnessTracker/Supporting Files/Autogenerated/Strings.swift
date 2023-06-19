// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable all

internal enum L10n {
  /// Second test
  internal static let secondTitle = L10n.tr("Localizable", "secondTitle")
  /// TestTitle
  internal static let title = L10n.tr("Localizable", "title")

  internal enum Authorization {
    /// Authorization Error
    internal static let alertTitle = L10n.tr("Localizable", "Authorization.alertTitle")
    /// Sign in
    internal static let authorization = L10n.tr("Localizable", "Authorization.authorization")
    /// Sign in with Facebook
    internal static let facebookSignUp = L10n.tr("Localizable", "Authorization.facebookSignUp")
    /// Sign in with Google
    internal static let googleSignUp = L10n.tr("Localizable", "Authorization.googleSignUp")
    /// Forgot password?
    internal static let passwordRecovery = L10n.tr("Localizable", "Authorization.passwordRecovery")
    /// Create account
    internal static let registration = L10n.tr("Localizable", "Authorization.registration")
    /// Authorization
    internal static let title = L10n.tr("Localizable", "Authorization.title")
    /// Wrong login or password
    internal static let wrongCredentials = L10n.tr("Localizable", "Authorization.wrongCredentials")

    internal enum Placeholder {
      /// Email
      internal static let email = L10n.tr("Localizable", "Authorization.placeholder.email")
      /// Password
      internal static let password = L10n.tr("Localizable", "Authorization.placeholder.password")
    }
  }

  internal enum CalendarView {
    /// S M T W T F S
    internal static let weekDays = L10n.tr("Localizable", "CalendarView.WeekDays")
  }

  internal enum Extensions {

    internal enum UIViewController {

      internal enum CustomAlert {
        /// Cancel
        internal static let cancelButton = L10n.tr("Localizable", "Extensions.UIViewController.CustomAlert.CancelButton")
      }

      internal enum SimpleAlert {
        /// OK
        internal static let buttonTitle = L10n.tr("Localizable", "Extensions.UIViewController.SimpleAlert.ButtonTitle")
      }
    }
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