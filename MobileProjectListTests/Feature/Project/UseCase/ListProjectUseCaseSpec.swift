//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

//swiftlint:disable function_body_length
final class ListProjectUseCaseSpec: QuickSpec {

    override func spec() {
        super.spec()
        describe("ListProjectUseCase") {
            var listProjectUseCase: ListProjectUseCase!
            var projectGateway: ProjectGatewayMock!
            var presenter: ProjectListPresenterInputMock!

            context("when is initialized") {
                beforeEach {
                    projectGateway = ProjectGatewayMock()
                    presenter = ProjectListPresenterInputMock()
                    listProjectUseCase = ListProjectUseCase(projectGateway: projectGateway, presenter: presenter)
                }

                context("with a valid project list response") {
                    beforeEach {
                        projectGateway.stubbedProjectsResult = Single.just(ProjectMock.validProjectList)
                    }

                    context("when list is called") {
                        beforeEach {
                            listProjectUseCase.list()
                        }

                        it("should call presenter show project") {
                            expect(presenter.invokedShow).to(beTrue())
                        }

                        it("should call presenter show project 1 time") {
                            expect(presenter.invokedShowCount).to(equal(1))
                        }

                        it("should call presenter show project with 2 items in the list") {
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

                context("with a error on project list response") {
                    beforeEach {
                        projectGateway.stubbedProjectsResult = Single.error(TestErrorAPI.unknownRequestError)
                    }

                    context("when list is called") {
                        beforeEach {
                            listProjectUseCase.list()
                        }

                        it("should not call presenter show project") {
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
