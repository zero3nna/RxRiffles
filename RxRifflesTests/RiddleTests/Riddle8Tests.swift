import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle8Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Void>!
    
    func testSolve() {
        observer = scheduler.createObserver(Void.self)
        let counter = AtomicInteger()
        let expectation = [Recorded.next(200, ()), Recorded.completed(200)]
        let input = Observable.just(()).do(onNext: { _ in
            _ = counter.incrementAndGet()
        }, onCompleted: {
            _ = counter.incrementAndGet()
        }, onSubscribe: {
            _ = counter.incrementAndGet()
        })

        _ = Riddle8().solve(source: input, scheduler: scheduler).subscribe(observer)

        XCTAssertTrue(observer.events.isEmpty)
        XCTAssertEqual(counter.value, 0)

        scheduler.advanceTo(100)
        XCTAssertTrue(observer.events.isEmpty)
        XCTAssertEqual(counter.value, 0)

        scheduler.advanceTo(200)
        XCTAssertTrue(observer.events.elementsEqual(expectation, by: { t1, t2 in
            type(of: t1.value.element) == type(of: t2.value.element) &&
                t1.time == t2.time
        }))
        XCTAssertEqual(counter.value, 3)
    }
}
