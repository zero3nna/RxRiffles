import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle1Tests: XCTestCase {
    
    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Int>!

    func testSolve() {
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
        let expectation = [Recorded.next(0, 5), Recorded.completed(0)]
        
        _ = Riddle1().solve(value: 5).subscribe(observer)

        XCTAssertEqual(observer.events, expectation)
    }
}
