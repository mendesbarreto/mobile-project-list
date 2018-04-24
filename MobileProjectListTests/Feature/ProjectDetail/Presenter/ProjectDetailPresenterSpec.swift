//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

//swiftlint: disable function_body_length
final class ProjectDetailPresenterSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ShowProjectDetailUseCase") {
            var projectDetailPresenter: ProjectDetailPresenter!
            var presenterOutput: ProjectDetailPresenterOutputMock!
            var project: Project!

            context("when initialized") {
                beforeEach {
                    presenterOutput = ProjectDetailPresenterOutputMock()
                    projectDetailPresenter = ProjectDetailPresenter(presenterOutput: presenterOutput)
                }

                context("when show project is called") {
                    beforeEach {
                        project = ProjectMock.project1
                        try? projectDetailPresenter.show(project: project)
                    }

                    it("should not call show alert view model presenter output") {
                        expect(presenterOutput.invokedShowAlertViewModel).to(beFalse())
                    }

                    it("should call show project view model presenter output") {
                        expect(presenterOutput.invokedShowProjectViewModel).to(beTrue())
                    }

                    it("should the content of view model string be the same as the model") {
                        let viewModel = presenterOutput.invokedShowProjectViewModelParameters?.projectViewModel
                        expect(viewModel?.description.string).to(equal(project.description))
                        expect(viewModel?.title.string).to(equal(project.name))
                        expect(viewModel?.peopleButtonTitle.string).to(equal(Strings.ProjectDetail.Button.people))
                        expect(viewModel?.tasksButtonTitle.string).to(equal(Strings.ProjectDetail.Button.tasks))
                        expect(viewModel?.companyName.string).to(equal(project.company.name))
                    }
                }

                context("when show loading is called") {
                    beforeEach {
                        projectDetailPresenter.showLoading()
                    }
                }

                context("when hide loading is called") {
                    beforeEach {
                        projectDetailPresenter.hideLoading(onComplete: nil)
                    }

                    it("should call presenter output hide loading with one argument") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                    }
                }
            }
        }
    }
}
