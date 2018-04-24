//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class AlertScreenFactory {
    static func make(viewModel: AlertViewModel) -> UIAlertController {
        let alertViewController = UIAlertController(title: viewModel.title,
                                                    message: viewModel.message,
                                                    preferredStyle: viewModel.style)

        viewModel.actions.forEach { action in
            alertViewController.addAction(action)
        }

        return alertViewController
    }
}
