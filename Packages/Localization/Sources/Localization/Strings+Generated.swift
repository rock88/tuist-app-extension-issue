import Foundation

public enum L10n {
    /// Test (EN)
    public static let test = L10n.tr("Localizable", "test")
}

private extension L10n {
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: .module, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
