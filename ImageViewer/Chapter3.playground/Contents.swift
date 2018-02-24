//: Playground - noun: a place where people can play
// synchronously
import RxSwift

public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

example(of: "PublishSubject") {
    let subj = PublishSubject<String>()
    subj.onNext("Is anyone listening?") // Só vai funcionar se estiver depois da próxima linha
    let subscOne = subj.subscribe(onNext: { string in
        print(string)
    })
    subj.on(.next("1"))
    subj.onNext("2")
    let subscTwo = subj.subscribe { event in
        print("2)", event.element ?? event)
    }
    subj.onNext("3")
    subscOne.dispose()
    subj.onNext("4")
    // 1
    subj.onCompleted()
    // 2
    subj.onNext("5")
    // 3
    subscTwo.dispose()
    let disposeBag = DisposeBag()
    // 4
    subj.subscribe {
        print("3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
    subj.onNext("?")
}
