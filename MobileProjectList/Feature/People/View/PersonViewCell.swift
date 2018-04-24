//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import SDWebImage

final class PersonViewCell: BindableCell<PersonViewModel> {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder)", file: #file, line: #line)
    }

    override func bind(viewModel: ViewModel) {
        super.bind(viewModel: viewModel)
        imageView?.sd_setImage(with: viewModel.profileUrlImage, placeholderImage: viewModel.placeHolderImage)
        textLabel?.attributedText = viewModel.name
    }

    private func setupLayout() {
        imageView?.layer.cornerRadius = 25
        imageView?.clipsToBounds = true
    }
}
