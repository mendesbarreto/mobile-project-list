//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol BindableView {
    associatedtype ViewModel

    func bind(viewModel: ViewModel)
}
