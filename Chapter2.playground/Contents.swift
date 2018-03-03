//: Playground - noun: a place where people can play
// synchronously
import RxSwift

public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

example(of: "just, of, from") {
    let one = 1
    let two = 2
    let three = 3
    
    let _: Observable<Int> = Observable<Int>.just(one)
    _ = Observable.of(one, two, three)
    _ = Observable.of([one, two, three])
    _ = Observable.from([one, two, three])
}

example(of: "subscribe") {
    let one = 1
    let two = 2
    let three = 3
    
    let o = Observable.of(one, two, three)
    // o.subscribe { event in
    //    print(event)
    // }
    o.subscribe(onNext: { element in
        print(element)
    })
}

example(of: "empty") {
    let obs = Observable<Void>.empty()
    obs.subscribe(
        onNext: {element in
            print(element)
    },
        onCompleted:{
            print("Completed")
    })
}

example(of: "never") {
    let obs = Observable<Any>.never()
    
    obs.subscribe(
        onNext: { element in
            print(element)
            
    }, onCompleted: {
        print("Completed")
    })
}

example(of: "range") {
    let obs = Observable<Int>.range(start: 1, count: 10)
    obs.subscribe(onNext:{ i in
        let n = Double(i)
        let fib = Int(((pow(1.61803, n) - pow(0.61803, n)) / 2.23606).rounded())
        print(fib)
    })
}

example(of: "dispose") {
    let obs = Observable.of("A", "B", "C")
    let subs = obs.subscribe(onNext: { element in
        print(element)
    })
    subs.dispose()
}

example(of: "DisposeBag") {
    let disposeBag = DisposeBag()
    Observable.of("A","B","C")
        .subscribe(onNext:{
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "create") {
    enum MyError: Error {
        case anError
    }
    
    let dispBag = DisposeBag()
    Observable<String>.create { obs in
        obs.onNext("1")
        //obs.onError(MyError.anError)
        obs.onCompleted()
        obs.onNext("?")
        return Disposables.create()
        }
        .subscribe(
            onNext: { print($0) },
            onError: { print($0) },
            onCompleted: { print("Completed") },
            onDisposed: { print("Disposed" )}
        )
        .disposed(by: dispBag)
}

example(of: "deferred") {
    let dispBag = DisposeBag()
    var flip = false
    let factory: Observable<Int> = Observable.deferred {
        flip = !flip
        if flip {
            return Observable.of(1, 2, 3)
        } else {
            return Observable.of(4, 5, 6)
        }
    }
    for _ in 0...3 {
        factory.subscribe(onNext: {
            print($0, terminator:" ")
        })
            .disposed(by: dispBag)
        print()
    }
}


