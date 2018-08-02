import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle2Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Int>!
    
    func testSolve() {
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
        let input = Observable.from([-1, 0, 5])
        let expectation = [Recorded.next(0, 0), Recorded.next(0, 1), Recorded.next(0, 6), Recorded.completed(0)]

        _ = Riddle2().solve(source: input).subscribe(observer)

        XCTAssertEqual(observer.events, expectation)
    }
}
