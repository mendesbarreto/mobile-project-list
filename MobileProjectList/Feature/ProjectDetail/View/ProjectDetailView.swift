//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

final class ProjectDetailView: BindableView<ProjectDetailViewModel> {

    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let companyNameLabel = UILabel()
    private let peopleButton = UIButton()
    private let tasksButton = UIButton()
    private let contentView = UIView()

    var onTaskRequested: SharedSequence<SignalSharingStrategy, Void> {
        return tasksButton.rx.tap.asSignal()
    }

    var onPeopleRequested: SharedSequence<SignalSharingStrategy, Void> {
        return peopleButton.rx.tap.asSignal()
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func bind(viewModel: ProjectDetailViewModel) {
        super.bind(viewModel: viewModel)
        titleLabel.attributedText = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        companyNameLabel.attributedText = viewModel.companyName
        tasksButton.setAttributedTitle(viewModel.tasksButtonTitle, for: .normal)
        peopleButton.setAttributedTitle(viewModel.peopleButtonTitle, for: .normal)
        logoImageView.sd_setImage(with: viewModel.logoUrl, placeholderImage: viewModel.logoPlaceHolder)
    }
}

// MARK: Layout

extension ProjectDetailView {
    private func setupLayout() {
        addSubview(contentView)
        addSubviewsToContentView()
        setupContentViewLayout()
        setupLogoLayout()
        setupTitleLayout()
        setupCompanyLayout()
        setupDescriptionLayout()
        setupPeopleLayout()
        setupTasksLayout()
    }

    private func addSubviewsToContentView() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(companyNameLabel)
        contentView.addSubview(peopleButton)
        contentView.addSubview(tasksButton)
    }

    private func setupTasksLayout() {
        tasksButton.layer.borderWidth = 2
        tasksButton.layer.borderColor = UIColor.lightGray.cgColor
        tasksButton.layer.cornerRadius = 5
        tasksButton.startAnchor()
                    .heightAnchor(equalToConstant: 50)
                    .trailingAnchor(to: contentView)
                    .leadingAnchor(to: contentView)
                    .bottomAnchor(toEqualAnchor: peopleButton.topAnchor, constant: -15)
    }

    private func setupPeopleLayout() {
        peopleButton.layer.borderWidth = 2
        peopleButton.layer.borderColor = UIColor.lightGray.cgColor
        peopleButton.layer.cornerRadius = 5
        peopleButton.startAnchor()
                    .heightAnchor(equalToConstant: 50)
                    .trailingAnchor(to: contentView)
                    .leadingAnchor(to: contentView)
                    .bottomAnchor(to: contentView)
    }

    private func setupDescriptionLayout() {
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 5
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.startAnchor()
                        .topAnchor(toEqualAnchor: companyNameLabel.bottomAnchor, constant: 15)
                        .trailingAnchor(to: contentView)
                        .leadingAnchor(to: contentView)
    }

    private func setupCompanyLayout() {
        companyNameLabel.textAlignment = .center
        companyNameLabel.startAnchor()
                        .topAnchor(toEqualAnchor: titleLabel.bottomAnchor, constant: 15)
                        .trailingAnchor(to: contentView)
                        .leadingAnchor(to: contentView)
    }

    private func setupTitleLayout() {
        titleLabel.textAlignment = .center
        titleLabel.startAnchor()
                  .topAnchor(toEqualAnchor: logoImageView.bottomAnchor, constant: 15)
                  .trailingAnchor(to: contentView)
                  .leadingAnchor(to: contentView)
    }

    private func setupLogoLayout() {
        logoImageView.image = Assets.icLogo.image
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.backgroundColor = .white
        logoImageView.startAnchor()
                     .heightAnchor(equalToConstant: 200)
                     .topAnchor(to: contentView)
                     .trailingAnchor(to: contentView)
                     .leadingAnchor(to: contentView)
    }

    private func setupContentViewLayout() {
        contentView.anchorToFit(in: self, constant: 20)
    }
}
