//: Playground - noun: a place where people can play

import RxSwift

public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

example(of: "ignoreElements") {
    
}
