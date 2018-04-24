//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

class BindableView<T>: UIView, Bindable {
    typealias ViewModel = T

    var viewModel: ViewModel!

    func bind(viewModel: ViewModel) {
       self.viewModel = viewModel
    }
}
