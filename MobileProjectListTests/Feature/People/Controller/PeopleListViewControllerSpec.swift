//
// Created by douglas.barreto on 4/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import RxCocoa
import Nimble
import UIKit

@testable import MobileProjectList

final class PeopleListViewControllerSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("PeopleListViewController") {
            var peopleListViewController: PeopleListViewController!
            var listPeopleUseCaseMock: ListPeopleInteractorMock!
            var tableView: UITableView!
            let projectId: String = "1"

            context("when initialized") {
                beforeEach {
                    listPeopleUseCaseMock = ListPeopleInteractorMock()
                    tableView = UITableView()
                    peopleListViewController = PeopleListViewController(projectId: projectId,
                                                                        listPeopleUseCase: listPeopleUseCaseMock,
                                                                        tableView: tableView,
                                                                        dataSource: PeopleListDataSource(personList: []))
                }

                context("when call view did load") {
                    beforeEach {
                        peopleListViewController.viewDidLoad()
                    }

                    it("expect table view with project cell registered") {
                        let cell = tableView.dequeueReusableCell(withIdentifier: PersonViewCell.identifier)
                        expect(cell).toNot(beNil())
                    }

                    it("expect table view data source be set") {
                        let dataSource = tableView.dataSource as? PeopleListDataSource
                        expect(dataSource).toNot(beNil())
                    }

                    context("when view did appear") {
                        beforeEach {
                            peopleListViewController.viewDidAppear(true)
                        }

                        it("should call list project use") {
                            expect(listPeopleUseCaseMock.invokedList).to(beTrue())
                        }

                        it("should call list project use case 1 time") {
                            expect(listPeopleUseCaseMock.invokedListCount).to(equal(1))
                        }
                    }
                }

            }
        }
    }
}
