//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class TaskViewCell: BindableCell<TaskViewModel> {
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupLayout()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init?(coder aDecoder: NSCoder)", file: #file, line: #line)
//    }
    override func bind(viewModel: ViewModel) {
        super.bind(viewModel: viewModel)
        imageView?.image = viewModel.image
        textLabel?.attributedText = viewModel.title
    }
}
