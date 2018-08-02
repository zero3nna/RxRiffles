import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle7Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Int>!
    
    func testSolve() {
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
        let input = Observable.from([1,2,3,4,4,5,4])
        let expectation = [Recorded.next(0, 1),
                           Recorded.next(0, 2),
                           Recorded.next(0, 3),
                           Recorded.next(0, 4),
                           Recorded.next(0, 5),
                           Recorded.completed(0)]

        _ = Riddle7().solve(source: input).subscribe(observer)

        XCTAssertEqual(observer.events, expectation)
    }
}


