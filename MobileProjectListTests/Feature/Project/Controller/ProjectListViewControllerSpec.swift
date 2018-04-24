//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import RxCocoa
import Nimble
import UIKit

@testable import MobileProjectList

final class ProjectListViewControllerSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ProjectListViewController") {
            var projectListViewController: ProjectListViewController!
            var listProjectUseCaseMock: ListProjectInteractorMock!
            var tableView: UITableView!

            context("when initialized") {
                beforeEach {
                    listProjectUseCaseMock = ListProjectInteractorMock()
                    tableView = UITableView()
                    projectListViewController = ProjectListViewController(listProjectUseCase: listProjectUseCaseMock,
                                                                          dataSource: ProjectListDataSource(),
                                                                          delegate: ProjectListDelegate(),
                                                                          tableView: tableView)
                }

                context("when call view did load") {
                    beforeEach {
                        projectListViewController.viewDidLoad()
                    }

                    it("expect table view with project cell registered") {
                        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectViewCell.identifier)
                        expect(cell).toNot(beNil())
                    }

                    it("expect table view delegate be set") {
                        let delegate = tableView.delegate as? RxTableViewDelegateProxy
                        expect(delegate).toNot(beNil())
                    }

                    it("expect table view data source be set") {
                        let dataSource = tableView.dataSource as? ProjectListDataSource
                        expect(dataSource).toNot(beNil())
                    }

                    context("when view did appear") {
                        beforeEach {
                            projectListViewController.viewDidAppear(true)
                        }

                        it("should call list project use") {
                            expect(listProjectUseCaseMock.invokedList).to(beTrue())
                        }

                        it("should call list project use case 1 time") {
                            expect(listProjectUseCaseMock.invokedListCount).to(equal(1))
                        }
                    }
                }

            }
        }
    }
}
