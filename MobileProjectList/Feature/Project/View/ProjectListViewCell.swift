//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

protocol BindableView {
    associatedtype ViewModel

    func bind(viewModel: ViewModel)
}

class BindableCell<T>: UITableViewCell {
    typealias ViewModel = T
    private(set) var viewModel: ViewModel!

    func bind(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

final class ProjectViewCell: BindableCell<ProjectCellViewModel> {

    private let titleLabel = UILabel()
    private let logoImageView = UIImageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    override func bind(viewModel: ViewModel) {
        super.bind(viewModel: viewModel)
        titleLabel.attributedText = viewModel.name
        logoImageView.image = UIImage()
    }
}

// MARK: Layout

extension ProjectViewCell {

    private func setupLayout() {
        logoImageView.contentMode = .scaleAspectFit

    }

}
