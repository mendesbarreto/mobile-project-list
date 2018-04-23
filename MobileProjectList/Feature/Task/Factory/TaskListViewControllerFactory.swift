//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class TaskListViewControllerFactory {
    static func make(projectId: String) -> UIViewController {
        return TaskListViewController(projectId: projectId)
    }
}
