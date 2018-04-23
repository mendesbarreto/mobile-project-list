//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class PeopleViewControllerFactory {
    static func make(projectId id: String) -> UIViewController {
        return PeopleListViewController(projectId: id)
    }
}
