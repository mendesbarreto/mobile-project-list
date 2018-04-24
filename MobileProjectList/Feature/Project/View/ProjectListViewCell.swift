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
    private let startContentView = UIView()
    private let tagsStackView = UIStackView()

    private var heightAnchorConstraint: NSLayoutConstraint!

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
        setupTagsView()
    }

    private func setupTagsView() {
        removeSubviewsFromStackTagViewIfNeeded()
        if viewModel.tags.count > 0 {
            heightAnchorConstraint.constant = 20
            var tagView: TagView!
            viewModel.tags.forEach { model in
                tagView = TagView()
                tagView.bind(viewModel: model)
                tagsStackView.addArrangedSubview(tagView)
            }
        } else {
            heightAnchorConstraint.constant = 0
        }
    }

    private func removeSubviewsFromStackTagViewIfNeeded() {
        tagsStackView.arrangedSubviews.forEach { view in
            tagsStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
         }
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
        setupStarContentView()
        setupTagStackViewLayout()
    }

    private func setupTagStackViewLayout() {
        heightAnchorConstraint = tagsStackView.heightAnchor.constraint(equalToConstant: 20)
        heightAnchorConstraint.isActive = true
        tagsStackView.startAnchor()
                     .bottomAnchor(to: contentView, constant: -5)
                     .leadingAnchor(toEqualAnchor: logoImageView.trailingAnchor, constant: 15)
                     .trailingAnchor(to: contentView)
        tagsStackView.distribution = .fillProportionally
        tagsStackView.axis = .horizontal
        tagsStackView.spacing = 3
        tagsStackView.backgroundColor = .clear
    }

    private func addSubViewToContentView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(logoImageView)
        contentView.addSubview(tagsStackView)
        contentView.addSubview(startContentView)
    }

    private func setupStarContentView() {
        startContentView.startAnchor()
                        .trailingAnchor(to: contentView)
                        .topAnchor(to: contentView)
                        .widthAnchor(equalToConstant: 40)
                        .bottomAnchor(toEqualAnchor: tagsStackView.topAnchor)
        startContentView.backgroundColor = .clear
    }

    private func setupDescriptionLayoutImage() {
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 2
        descriptionLabel.startAnchor()
                        .topAnchor(toEqualAnchor: titleLabel.bottomAnchor, constant: 5)
                        .leadingAnchor(toEqualAnchor: logoImageView.trailingAnchor, constant: 15)
                        .trailingAnchor(toEqualAnchor: startImageView.leadingAnchor, constant: -8)
                        .bottomAnchor(toEqualAnchor: tagsStackView.topAnchor, constant: -20)
    }

    private func setupStartImageLayout() {
        startContentView.addSubview(startImageView)
        startImageView.startAnchor()
                      .heightAnchor(equalToConstant: 30)
                      .widthAnchor(equalToConstant: 30)
                      .centerYAnchor(toEqualAnchor: startContentView.centerYAnchor)
                      .centerXAnchor(toEqualAnchor: startContentView.centerXAnchor)
        startImageView.backgroundColor = .clear
        startImageView.contentMode = .scaleAspectFit
    }

    private func setupTitleLayout() {
        titleLabel.startAnchor()
                  .heightAnchor(equalToConstant: 40)
                  .leadingAnchor(toEqualAnchor: logoImageView.trailingAnchor, constant: 15)
                  .trailingAnchor(to: contentView)
                  .topAnchor(to: contentView, constant: 10)
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
