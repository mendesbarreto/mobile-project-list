//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

final class PeopleListPresenterSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("PeopleListPresenter") {
            var peopleListPresenter: PeopleListPresenter!
            var presenterOutput: PeopleListPresenterOutputMock!

            context("when is initialized") {
                beforeEach {
                    presenterOutput = PeopleListPresenterOutputMock()
                    peopleListPresenter = PeopleListPresenter(presenterOutput: presenterOutput)
                }

                context("when show list is called") {
                    context("with 2 items") {
                        beforeEach {
                            try? peopleListPresenter.show(list: PeopleMock.people)
                        }

                        it("should call presenter output show people") {
                            expect(presenterOutput.invokedShowPeople).to(beTrue())
                        }

                        it("should not call presenter output show empty state") {
                            expect(presenterOutput.invokedShowAlert).to(beFalse())
                        }

                        it("should call presenter output show people with two items") {
                            expect(presenterOutput.invokedShowPeopleParameters?.people.count).to(equal(2))
                        }

                        it("should the content of view model string be the same as the model") {
                            let viewModel = presenterOutput.invokedShowPeopleParameters?.people[0]
                            let person = PeopleMock.person1
                            let name =  "\(person.firstName) \(person.lastName) at: \(person.companyName)"
                            expect(viewModel?.name.string).to(equal(name))
                        }
                    }
                }

                context("when show loading is called") {
                    beforeEach {
                        peopleListPresenter.showLoading()
                    }
                }

                context("when hide loading is called") {
                    beforeEach {
                        peopleListPresenter.hideLoading(onComplete: nil)
                    }

                    it("should call presenter output hide loading with one argument") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                    }
                }

                context("when show empty state is called") {
                    beforeEach {
                        peopleListPresenter.showEmptyState()
                    }

                    it("should call presenter output show alert") {
                        expect(presenterOutput.invokedShowAlert).to(beTrue())
                    }
                }
            }
        }
    }
}
