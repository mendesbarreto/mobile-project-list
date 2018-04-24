//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble

@testable import MobileProjectList

final class ProjectListViewControllerFactorySpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ProjectListViewControllerFactory") {
            var viewController: UIViewController!

            context("when call make") {
                beforeEach {
                    viewController = ProjectListViewControllerFactory.make()
                }

                context("when convert to project list") {
                    it("expect not be nil") {
                        let projectListViewController = viewController as? ProjectListViewController
                        expect(projectListViewController).toNot(beNil())
                    }
                }
            }

        }
    }
}
