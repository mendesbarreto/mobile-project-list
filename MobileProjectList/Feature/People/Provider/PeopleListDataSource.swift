//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class PeopleListDataSource: NSObject, UITableViewDataSource {
    private var personList: [PersonViewModel] = []

    init(personList: [PersonViewModel]) {
        self.personList = personList
    }

    func replace(personList: [PersonViewModel]) {
        self.personList = personList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }

    //swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonViewCell.identifier, for: indexPath) as! PersonViewCell
        cell.bind(viewModel: personList[indexPath.row])
        return cell
    }
}
