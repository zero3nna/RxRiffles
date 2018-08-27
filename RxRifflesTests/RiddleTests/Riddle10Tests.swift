import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle10Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<(Int, String)>!

    func testSolve() {
        observer = scheduler.createObserver((Int, String).self)
        let first = Observable.from([1,2])
        let function: (Int) -> Observable<String> = { int in
            if int == 1 {
                return Observable.from(["1", "2", "3"])
            } else {
                return Observable.from(["5", "6"])
            }
        }

        _ = Riddle10().solve(first: first, function: function).subscribe(observer)

        let expectation = [Recorded.next(0, (1 ,"1")),
                           Recorded.next(0, (1, "2")),
                           Recorded.next(0, (2, "5")),
                           Recorded.next(0, (1, "3")),
                           Recorded.next(0, (2, "6")),
                           Recorded.completed(0)]

        XCTAssertTrue(observer.events.elementsEqual(expectation, by: { t1, t2 in
            t1.value.element?.0 == t2.value.element?.0 &&
            t1.value.element?.1 == t2.value.element?.1 &&
            t1.time == t2.time
        }))
    }
}

