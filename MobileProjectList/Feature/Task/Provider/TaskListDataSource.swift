//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class TaskListDataSource: NSObject, UITableViewDataSource {
    private var taskList: [TaskViewModel] = []

    init(taskList: [TaskViewModel]) {
        self.taskList = taskList
    }

    func replace(taskList: [TaskViewModel]) {
        self.taskList = taskList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }

    //swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskViewCell.identifier, for: indexPath) as! TaskViewCell
        cell.bind(viewModel: taskList[indexPath.row])
        return cell
    }
}
