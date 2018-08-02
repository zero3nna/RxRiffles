import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle6Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<(Int, Int)>!
    
    func testSolve() {
        observer = scheduler.createObserver((Int, Int).self)
        scheduler.start()
        let subscribeCounter = AtomicInteger()
        let first = Single<Int>.timer(5, scheduler: scheduler).map { _ in 10 }.do(onSubscribe: { _ = subscribeCounter.incrementAndGet() })
        let second = Single<Int>.just(5).do(onSubscribe: { _ = subscribeCounter.incrementAndGet() })

        _ = Riddle6Solution().solve(first: first, second: second).asObservable().subscribe(observer)

        XCTAssertEqual(observer.events.count, 0)
        XCTAssertEqual(subscribeCounter.value, 2)

        scheduler.advanceTo(4)
        XCTAssertEqual(observer.events.count, 0)

        scheduler.advanceTo(5)
        let expectation = [Recorded.next(5, (10, 5)), Recorded.completed(5)]
        XCTAssertTrue(observer.events.elementsEqual(expectation, by: { t1, t2 in
            t1.value.element?.0 == t2.value.element?.0 &&
            t1.value.element?.1 == t2.value.element?.1 &&
            t1.time == t2.time
        }))
    }
}
