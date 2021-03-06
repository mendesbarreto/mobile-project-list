//
// Created by Douglas Mendes Barreto. on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import NSObject_Rx

class BaseViewController: UIViewController, HasDisposeBag {

    private var loadingAlert: UIAlertController?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        print("this class can not be initialized for NSCoder arg")
        return nil
    }

    func setNavigation(title: String) {
        self.title = title
    }
}

extension BaseViewController: LoadingPresenter {
    func showLoading() {
        loadingAlert = LoadingAlertScreenFactory.make()
        present(loadingAlert!, animated: true)
    }

    func hideLoading(onComplete: (() -> Void)?) {
        guard let loadingAlert = self.loadingAlert else {
            onComplete?()
            return
        }

        loadingAlert.dismiss(animated: true) { [weak self] in
            onComplete?()
            self?.loadingAlert = nil
        }
    }
}
