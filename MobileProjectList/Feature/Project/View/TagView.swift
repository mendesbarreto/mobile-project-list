//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class TagView: BindableView<TagViewModel> {

    private let title = UILabel()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func bind(viewModel: ViewModel) {
        super.bind(viewModel: viewModel)
        title.attributedText = viewModel.title
        backgroundColor = viewModel.backgroundColor
        layer.cornerRadius = viewModel.cornerRadios
    }
}

// MARK: Layout

extension TagView {
    private func setupLayout() {
        addSubview(title)
        title.anchorToFit(in: self)
        title.textAlignment = .center
    }
}
