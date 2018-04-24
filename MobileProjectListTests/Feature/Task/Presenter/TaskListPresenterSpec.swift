//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

final class TaskListPresenterSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("TaskListPresenter") {
            var taskListPresenter: TaskListPresenter!
            var presenterOutput: TaskListPresenterOutputMock!

            context("when is initialized") {
                beforeEach {
                    presenterOutput = TaskListPresenterOutputMock()
                    taskListPresenter = TaskListPresenter(presenterOutput: presenterOutput)
                }

                context("when show list is called") {
                    context("with 2 items") {
                        beforeEach {
                            try? taskListPresenter.show(list: TaskMock.tasks)
                        }

                        it("should call presenter output show tasks") {
                            expect(presenterOutput.invokedShowTasksViewModel).to(beTrue())
                        }

                        it("should not call presenter output show empty state") {
                            expect(presenterOutput.invokedShowAlert).to(beFalse())
                        }

                        it("should call presenter output show tasks with two items") {
                            expect(presenterOutput.invokedShowTasksViewModelParameters?.tasksViewModel.count).to(equal(2))
                        }

                        it("should the content of view model string be the same as the model task") {
                            let viewModel = presenterOutput.invokedShowTasksViewModelParameters?.tasksViewModel[0]
                            let task = TaskMock.task1
                            expect(viewModel?.title.string).to(equal(task.name))
                        }
                    }
                }

                context("when show loading is called") {
                    beforeEach {
                        taskListPresenter.showLoading()
                    }
                }

                context("when hide loading is called") {
                    beforeEach {
                        taskListPresenter.hideLoading(onComplete: nil)
                    }

                    it("should call presenter output hide loading with one argument") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                    }
                }

                context("when show empty state is called") {
                    beforeEach {
                        taskListPresenter.showEmptyState()
                    }

                    it("should call presenter output show alert") {
                        expect(presenterOutput.invokedShowAlert).to(beTrue())
                    }
                }
            }
        }
    }
}
