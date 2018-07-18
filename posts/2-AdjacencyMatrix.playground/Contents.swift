import Foundation

/**
 * Adjacency Matrix for the following graph:
 *               A
 *             /   \
 *            B     C
 *          /  \     \
 *         D    E     F
 */
let matrix: [[Int]] = [
    [0, 1, 1, 0, 0, 0],
    [0, 0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0]
]

/*******************************************/
/** Existence Check with Adjacency Matrix **/
/*******************************************/

func isIndexValid(_ index: (row: Int, col: Int), in matrix: [[Int]]) -> Bool {
    guard !matrix.isEmpty else { return false }
    let rowCount = matrix.count
    let colCount = matrix[0].count

    guard index.row >= 0 && index.row < rowCount &&
        index.col >= 0 && index.col < colCount else {
        return false
    }
    return true
}

func hasEdge(in matrix: [[Int]], from row: Int, to col: Int) -> Bool {
    guard isIndexValid((row, col), in: matrix) else { return false }
    return matrix[row][col] == 1
}

print(hasEdge(in: matrix, from: 2, to: 5)) // prints true
print(hasEdge(in: matrix, from: 5, to: 2)) // prints false

/*******************************/
/** DFS with Adjacency Matrix **/
/*******************************/

// Each row/col corresponds to an edge name: 0 - A, 1 - B, etc.
let edgesLookup = ["A", "B", "C", "D", "E", "F"]
var rowsVisited: Set<Int> = []

func dfsMatrix(_ matrix: [[Int]], row: Int = 0) {
    guard !matrix.isEmpty else { return }

    print(edgesLookup[row])
    rowsVisited.insert(row)
    
    let colCount = matrix[row].count
    for col in 0..<colCount {
        if matrix[row][col] == 1 && !rowsVisited.contains(col) {
            dfsMatrix(matrix, row: col)
        }
    }
}

dfsMatrix(matrix)
