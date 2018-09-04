import UIKit

struct User {
    var id: String
    var isSubscribed: Bool
    var themeColor: UIColor?
    var countryCode: String
}

class Theme {
    let backgroundColor: UIColor

    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor ?? .white
    }
}

class UserTheme: Theme {
    let user: User

    init(user: User) {
        self.user = user
        var themeColor: UIColor?
        if self.user.isSubscribed && self.user.countryCode == "CA" {
            themeColor = self.user.themeColor
        }

        super.init(backgroundColor: themeColor)
    }
}
