//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

struct ProjectCellViewModel {
    let name: NSAttributedString
    let description: NSAttributedString
    let logoUrl: URL
    let identifier: String
    let placeHolderImage: UIImage
    let startImage: UIImage
    let startImageColor: UIColor
    let tags: [TagViewModel]
}
