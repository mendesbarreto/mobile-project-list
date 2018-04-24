//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

//swiftlint:disable function_body_length
final class ListPeopleUseCaseSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ListPeopleUseCase") {
            var listPeopleUseCase: ListPeopleUseCase!
            var peopleGateway: PeopleGatewayMock!
            var presenter: PeopleListPresenterInputMock!

            context("when is initialized") {
                beforeEach {
                    peopleGateway = PeopleGatewayMock()
                    presenter = PeopleListPresenterInputMock()
                    listPeopleUseCase = ListPeopleUseCase(peopleGateway: peopleGateway, presenter: presenter)
                }

                context("with a valid people list response") {
                    beforeEach {
                        peopleGateway.stubbedPeopleByProjectIdResult = Single.just(PeopleMock.people)
                    }

                    context("when list people by project is called") {
                        beforeEach {
                            listPeopleUseCase.list(byProjectId: "1")
                        }

                        it("should call presenter show people") {
                            expect(presenter.invokedShow).to(beTrue())
                        }

                        it("should call presenter show people 1 time") {
                            expect(presenter.invokedShowCount).to(equal(1))
                        }

                        it("should call presenter show people with 2 items in the list") {
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

                context("with a error on people list response") {
                    beforeEach {
                        peopleGateway.stubbedPeopleByProjectIdResult = Single.error(TestErrorAPI.unknownRequestError)
                    }

                    context("when list people by project is called") {
                        beforeEach {
                            listPeopleUseCase.list(byProjectId: "1")
                        }

                        it("should not call presenter show people") {
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
