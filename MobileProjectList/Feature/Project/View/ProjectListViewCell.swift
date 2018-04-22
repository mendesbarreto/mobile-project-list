//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import SDWebImage

final class ProjectViewCell: BindableCell<ProjectCellViewModel> {

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let logoImageView = UIImageView()
    private let startImageView = UIImageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder)", file: #file, line: #line)
    }

    override func bind(viewModel: ViewModel) {
        super.bind(viewModel: viewModel)
        titleLabel.attributedText = viewModel.name
        descriptionLabel.attributedText = viewModel.description
        logoImageView.sd_setImage(with: viewModel.logoUrl, placeholderImage: viewModel.placeHolderImage)
        startImageView.image = viewModel.startImage
        startImageView.tintColor = viewModel.startImageColor
        accessibilityIdentifier = viewModel.identifier
    }
}

// MARK: Layout

extension ProjectViewCell {

    private func setupLayout() {
        addSubViewToContentView()
        setupLogoLayout()
        setupTitleLayout()
        setupStartImageLayout()
        setupDescriptionLayoutImage()
    }

    private func setupDescriptionLayoutImage() {
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 2
        descriptionLabel.startAnchor()
                        .topAnchor(toEqualAnchor: titleLabel.bottomAnchor, constant: 5)
                        .leadingAnchor(toEqualAnchor: logoImageView.trailingAnchor, constant: 15)
                        .trailingAnchor(toEqualAnchor: startImageView.leadingAnchor, constant: -8)
    }

    private func setupStartImageLayout() {
        startImageView.startAnchor()
                      .heightAnchor(equalToConstant: 30)
                      .widthAnchor(equalToConstant: 30)
                      .centerYAnchor(toEqualAnchor: contentView.centerYAnchor)
                      .trailingAnchor(to: contentView, constant: -8)
        startImageView.backgroundColor = .clear
        startImageView.contentMode = .scaleAspectFit
    }

    private func setupTitleLayout() {
        titleLabel.startAnchor()
                  .leadingAnchor(toEqualAnchor: logoImageView.trailingAnchor, constant: 15)
                  .trailingAnchor(to: contentView)
                  .topAnchor(to: contentView, constant: 10)
    }

    private func addSubViewToContentView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(startImageView)
        contentView.addSubview(logoImageView)
    }

    private func setupLogoLayout() {
        logoImageView.startAnchor()
                     .topAnchor(to: contentView)
                     .leadingAnchor(to: contentView)
                     .bottomAnchor(to: contentView)
                .widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        logoImageView.backgroundColor = .clear
    }
}
