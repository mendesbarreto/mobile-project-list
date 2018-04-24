//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ProjectListDataSource: NSObject, UITableViewDataSource {
    private var projectList: [ProjectCellViewModel] = []

    func replace(projects: [ProjectCellViewModel]) {
        projectList = projects
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }

    //swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectViewCell.identifier, for: indexPath) as! ProjectViewCell
        cell.bind(viewModel: projectList[indexPath.row])
        return cell
    }
}
