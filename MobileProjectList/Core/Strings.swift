//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

//swiftlint:disable nesting
struct Strings {

    struct ProjectDetail {
        struct Button {
            static let people = "People"
            static let tasks = "Tasks"
        }
    }

    struct ProjectList {
        struct Nav {
            static let title = "Project List"
        }
    }

    struct PeopleList {
        struct Nav {
            static let title = "People"
        }
    }

    struct TaskList {
        struct Nav {
            static let title = "Tasks"
        }
    }

    struct App {
        static let baseUrl = "https://yat.teamwork.com"
        static let apiToken = "twp_k9ejP88LcuojHjmFkUFuYIUNYalg"
    }

    struct Alert {
        struct Loading {
            static let message = "Please wait..."
        }

        struct Error {
            static let title = "Ops.."
            static let message = "Some problem on process your information"
        }

        struct ProjectListEmpty {
            static let title = "Ops.."
            static let message = "You do not have any project added to your account"
        }
    }
}
