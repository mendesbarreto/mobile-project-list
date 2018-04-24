//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble
import UIKit

@testable import MobileProjectList

final class ProjectListPresenterSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ListProjectUseCase") {
            var projectListPresenter: ProjectListPresenter!
            var presenterOutput: ProjectListPresenterOutputMock!
            context("when is initialized") {
                beforeEach {
                    presenterOutput = ProjectListPresenterOutputMock()
                    projectListPresenter = ProjectListPresenter(presenterOutput: presenterOutput)
                }

                context("when show list is called") {
                    context("with 1 project with invalid tag") {
                        beforeEach {
                            try? projectListPresenter.show(list: [ProjectMock.projectInvalidTagColor])
                        }

                        it("expect tagViewModel color red as default") {
                            let viewModel = presenterOutput.invokedShowProjectsParameters?.projects.first
                            let tag = viewModel?.tags.first
                            expect(tag?.backgroundColor).to(equal(UIColor.red))
                        }
                    }

                    context("with 2 items") {
                        beforeEach {
                            try? projectListPresenter.show(list: ProjectMock.validProjectList)
                        }

                        it("should call presenter output show projects") {
                            expect(presenterOutput.invokedShowProjects).to(beTrue())
                        }

                        it("should not call presenter output show empty state") {
                            expect(presenterOutput.invokedShowAlertViewModel).to(beFalse())
                        }

                        it("should call presenter output show projects with two items") {
                            expect(presenterOutput.invokedShowProjectsParameters?.projects.count).to(equal(2))
                        }
                    }
                }

                context("when show loading is called") {
                    beforeEach {
                        projectListPresenter.showLoading()
                    }
                }

                context("when hide loading is called") {
                    beforeEach {
                        projectListPresenter.hideLoading(onComplete: nil)
                    }

                    it("should call presenter output hide loading with one argument") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                    }
                }

                context("when show empty state is called") {
                    beforeEach {
                        projectListPresenter.showEmptyState()
                    }

                    it("should call presenter output show alert") {
                        expect(presenterOutput.invokedShowAlertViewModel).to(beTrue())
                    }
                }
            }
        }
    }
}
