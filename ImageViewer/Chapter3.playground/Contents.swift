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

enum MyError: Error {
    case anError
}

func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
    print(label, event.element ?? event.error ?? event)
}

example(of: "BehaviorSubject") {
    let subject = BehaviorSubject(value: "Initial value")
    let disposeBag = DisposeBag()
    
    subject.onNext("X")
    
    subject
        .subscribe {
            print(label: "1)", event: $0)
        }
        .disposed(by: disposeBag)
    
    subject.onError(MyError.anError)
    subject
        .subscribe {
            print(label: "2)", event: $0)
        }
        .disposed(by: disposeBag)
}

example(of: "ReplaySubject") {
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    let disposeBag = DisposeBag()
    
    subject.onNext("1")
    subject.onNext("2")
    subject.onNext("3")
    
    subject
        .subscribe() {
            print(label: "1)", event: $0)
        }
        .disposed(by: disposeBag)
    subject
        .subscribe {
            print(label: "2)", event: $0)
        }
        .disposed(by: disposeBag)
    subject.onNext("4")
    
    subject.onError(MyError.anError)
    subject.dispose()
    
    subject
        .subscribe {
            print(label: "3)", event: $0)
        }
        .disposed(by: disposeBag)
}

example(of: "Variable") {
    let variable = Variable("Initial value")
    let disposeBag = DisposeBag()
    variable.value = "New initial value"
    variable.asObservable()
        .subscribe {
            print(label: "1)", event: $0)
        }
        .disposed(by: disposeBag)
    
    variable.value = "1"
    variable.asObservable()
        .subscribe {
            print(label: "2)", event: $0)
        }
        .disposed(by: disposeBag)
    variable.value = "2"
}
