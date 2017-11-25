/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function named **shortestDistance** that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 The function header should look like this:
 
  ![example](example1.png "example")
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a new **Line** structure.
 
 Recall that a line is defined by it's *slope* and it's *vertical intercept*. What stored properties would you create for a **Line** structure?
 
 Recall that slope, in turn, is defined by it's *rise* and *run*. Could you create a **Slope** structure? What stored properties might it define?
 
 Recall that the shortest distance from a point to a line is the *perpendicular* distance from that point to the line.
 
 Here is a [complete example showing how to find the shortest distance from a point to a line](http://russellgordon.ca/lcs/shortest-distance-example.pdf), using symbolic algebra.
 
 Your job is to implement a solution in code that carries out the necessary mathematics. The beautiful part of this effort is that, once you've "taught" the computer how to do this correctly, you will never need to do this type of work manually again. 👍🏽😅🎉

*/

// Begin here... once you teach the computer to do this, you will never need to do it by hand again! :)

struct Point {
    var x : Double = 6.0
    var y : Double = 1.5
}

var cabinSite = Point(x: 5, y: 5)


struct Slope {
    var rise : Double = 1.0
    var run : Double = 1.0
}

struct Line {
    var slope : Slope = Slope(rise: 1.0, run: 1.0)
    var verticalIntercept : Double = 0.0
}



var slopeOfTheExistingRoad = Slope(rise: -1, run: 2)
var daRealRoad = Line(slope: slopeOfTheExistingRoad, verticalIntercept: 9.5)

func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {
    return Slope (rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
    
}



let perpendicularLine = getSlopeOfPerpendicularLine(from: daRealRoad)
print(perpendicularLine)





