//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

//swiftlint:disable function_body_length
final class ShowProjectDetailUseCaseSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ShowProjectDetailUseCase") {
            var listProjectUseCase: ShowProjectDetailUseCase!
            var projectGateway: ProjectGatewayMock!
            var presenter: ProjectDetailPresenterInputMock!
            context("when is initialized") {
                beforeEach {
                    projectGateway = ProjectGatewayMock()
                    presenter = ProjectDetailPresenterInputMock()
                    listProjectUseCase = ShowProjectDetailUseCase(presenter: presenter, projectGateway: projectGateway)
                }

                context("with a valid project response") {
                    beforeEach {
                        projectGateway.stubbedProjectResult = Single.just(ProjectMock.project1)
                    }

                    context("when show project by id is called") {
                        beforeEach {
                            listProjectUseCase.show(projectById: "1")
                        }

                        it("should call presenter show project") {
                            expect(presenter.invokedShow).to(beTrue())
                        }

                        it("should call presenter show project 1 time") {
                            expect(presenter.invokedShowCount).to(equal(1))
                        }

                        it("should call presenter show project with project model") {
                            let projectReceived = presenter.invokedShowParameters?.project
                            let projectSent = ProjectMock.project1
                            expect(projectReceived).toNot(beNil())
                            expect(projectReceived?.id).to(equal(projectSent.id))
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

                context("with a error on project response") {
                    beforeEach {
                        projectGateway.stubbedProjectResult = Single.error(TestErrorAPI.unknownRequestError)
                    }

                    context("when show project by id is called") {
                        beforeEach {
                            listProjectUseCase.show(projectById: "2")
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
