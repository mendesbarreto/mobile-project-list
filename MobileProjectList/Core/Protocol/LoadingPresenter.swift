//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol LoadingPresenter {
    func showLoading()

    func hideLoading(onComplete: (() -> Void)?)
}
