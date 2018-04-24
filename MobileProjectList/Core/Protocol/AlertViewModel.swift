//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

protocol AlertViewModel {
    var title: String { get }
    var message: String { get }
    var style: UIAlertControllerStyle { get }
    var actions: [UIAlertAction] { get }
}
