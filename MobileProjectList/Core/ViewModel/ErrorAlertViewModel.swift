//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

struct ErrorAlertViewModel: AlertViewModel {
    let title: String
    let message: String
    let style: UIAlertControllerStyle
    private(set) var actions: [UIAlertAction] = []

    init(title: String, message: String) {
        self.title = title
        self.message = message
        self.style = .alert
        addDismissButton()
    }

    private mutating func addDismissButton() {
        let actionsOk = UIAlertAction(title: "OK", style: .cancel)
        actions.append(actionsOk)
    }
}
