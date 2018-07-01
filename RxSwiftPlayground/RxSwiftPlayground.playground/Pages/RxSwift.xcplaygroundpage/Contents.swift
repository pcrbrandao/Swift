//: Please build the scheme 'RxSwiftPlayground' first
import RxSwift

enum MyError: Error {
    case anError
}

example(of: "create") {
    
    let disposeBag = DisposeBag()
    Observable<String>.create { observer in
        observer.onNext("1")
        observer.onNext("2")
        observer.onError(MyError.anError)
        observer.onCompleted()
        observer.onNext("?")
        return Disposables.create()
    }.subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
    )
    .disposed(by: disposeBag)
}

example(of: "just, of, from") {
    // 1
    let one = 1
    let two = 2
    let three = 3
    
    let observable: Observable<Int> = Observable<Int>.just(one)
    let observable2 = Observable.of(one, two, three)
    let observable3 = Observable.of([one, two, three])
    let observable4 = Observable.from([one, two, three])
    
    print("\([observable, observable2, observable3, observable4].count)")
}

example(of: "dispose") {
    let observable = Observable.of("a", "b", "c")
    let subscription = observable.subscribe { event in
        print(event)
    }
    subscription.dispose()
}

example(of: "DisposeBag") {
    let disposeBag = DisposeBag()
    Observable.of("a", "b", "c")
        .subscribe {
            print($0)
    }
    .disposed(by: disposeBag)
}
