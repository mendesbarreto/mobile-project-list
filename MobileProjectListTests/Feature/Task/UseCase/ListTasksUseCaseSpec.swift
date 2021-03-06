//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

//swiftlint:disable function_body_length
class ListTasksUseCaseSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe(" ListTasksUseCase") {
            var listTaskUseCase: ListTasksUseCase!
            var taskGateway: TaskGatewayMock!
            var presenter: TaskListPresenterInputMock!

            context("when is initialized") {
                beforeEach {
                    taskGateway = TaskGatewayMock()
                    presenter = TaskListPresenterInputMock()
                    listTaskUseCase =  ListTasksUseCase(taskGateway: taskGateway, presenter: presenter)
                }

                context("with a valid tasks list response") {
                    beforeEach {
                        taskGateway.stubbedTasksResult = Single.just(TaskMock.tasks)
                    }

                    context("when list tasks by project is called") {
                        beforeEach {
                            listTaskUseCase.list(byProjectId: "1")
                        }

                        it("should call presenter show tasks") {
                            expect(presenter.invokedShow).to(beTrue())
                        }

                        it("should call presenter show tasks 1 time") {
                            expect(presenter.invokedShowCount).to(equal(1))
                        }

                        it("should call presenter show tasks with 2 items in the list") {
                            expect(presenter.invokedShowParameters?.list.count).to(equal(2))
                        }

                        it("should call presenter show loading") {
                            expect(presenter.invokedShowLoading).to(beTrue())
                        }

                        it("should call presenter show loading 1 time") {
                            expect(presenter.invokedShowLoadingCount).to(equal(1))
                        }

                        it("should call presenter hide loading") {
                            expect(presenter.invokedHideLoading).to(beTrue())
                        }

                        it("should call presenter hide loading 1 time") {
                            expect(presenter.invokedHideLoadingCount).to(equal(1))
                        }

                        it("should not call presenter show error") {
                            expect(presenter.invokedShowError).to(beFalse())
                        }
                    }

                }

                context("with a error on tasks list response") {
                    beforeEach {
                        taskGateway.stubbedTasksResult = Single.error(TestErrorAPI.unknownRequestError)
                    }

                    context("when list tasks by project is called") {
                        beforeEach {
                            listTaskUseCase.list(byProjectId: "1")
                        }

                        it("should not call presenter show tasks") {
                            expect(presenter.invokedShow).to(beFalse())
                        }

                        it("should call presenter show loading") {
                            expect(presenter.invokedShowLoading).to(beTrue())
                        }

                        it("should call presenter show loading 1 time") {
                            expect(presenter.invokedShowLoadingCount).to(equal(1))
                        }

                        it("should call presenter hide loading") {
                            expect(presenter.invokedHideLoading).to(beTrue())
                        }

                        it("should call presenter hide loading 1 time") {
                            expect(presenter.invokedHideLoadingCount).to(equal(1))
                        }

                        it("should call presenter show error") {
                            expect(presenter.invokedShowError).to(beTrue())
                        }

                        it("should call presenter show error") {
                            expect(presenter.invokedShowError).to(beTrue())
                        }

                        it("should call presenter show error 1 time") {
                            expect(presenter.invokedShowErrorCount).to(equal(1))
                        }
                    }

                }
            }
        }
    }
}
