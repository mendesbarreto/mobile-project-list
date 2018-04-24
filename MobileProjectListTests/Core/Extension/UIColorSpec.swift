//
// Created by douglas.barreto on 4/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import RxSwift
import Nimble
import UIKit

@testable import MobileProjectList

final class UIColorSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("UIColor") {
            var color: UIColor!

            context("when initialized") {
                context("with red color string") {
                    beforeEach {
                        color = try? UIColor(string: "#FF0000")
                    }

                    it("expect red color") {
                        expect(color).to(equal(UIColor.red))
                    }
                }

                context("with green color string") {
                    beforeEach {
                        color = try? UIColor(string: "#00FF00")
                    }

                    it("expect red color") {
                        expect(color).to(equal(UIColor.green))
                    }
                }

                context("with blue color string") {
                    beforeEach {
                        color = try? UIColor(string: "#0000FF")
                    }

                    it("expect red color") {
                        expect(color).to(equal(UIColor.blue))
                    }
                }

                context("with invalid hex color") {
                    it("expect a throw at initialization") {
                        expect { try UIColor(string: "#ZZ00FF") }.to(throwError(errorType: UIColorError.self))
                    }
                }
            }

        }
    }
}
