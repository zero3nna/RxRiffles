import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle3Tests: XCTestCase {
    
    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Int>!
    
    func testSolve() {
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
        let input = Observable.range(start: 0, count: 10)
        let expectation = [Recorded.next(0, 0),
                           Recorded.next(0, 2),
                           Recorded.next(0, 4),
                           Recorded.next(0, 6),
                           Recorded.next(0, 8),
                           Recorded.completed(0)]
        
        _ = Riddle3().solve(source: input).subscribe(observer)
        
        XCTAssertEqual(observer.events, expectation)
    }
}
