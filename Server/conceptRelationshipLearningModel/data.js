
const SAMPLE_TESTS = [
    // CS 101 (7 samples)
    {
      summary: "A variable is a named memory location used to store values that can change during program execution.",
      expected: "CS 101"
    },
    {
      summary: "An if statement evaluates a boolean expression and executes code blocks conditionally.",
      expected: "CS 101"
    },
    {
      summary: "A function is a reusable block of code that takes inputs, performs operations, and may return a value.",
      expected: "CS 101"
    },
    {
      summary: "Loops such as for and while allow repeated execution of a code segment until a termination condition is met.",
      expected: "CS 101"
    },
    {
      summary: "Primitive data types like integer, float, and string define the nature of values variables can hold.",
      expected: "CS 101"
    },
    {
      summary: "Compilation translates human-readable source code into machine code that a CPU can execute directly.",
      expected: "CS 101"
    },
    {
      summary: "Comments are non‑executable annotations in code meant to explain logic to human readers.",
      expected: "CS 101"
    },

    // Operating Systems (7 samples)
    {
      summary: "Virtual memory uses disk storage to extend the apparent amount of RAM available to running programs.",
      expected: "Operating Systems"
    },
    {
      summary: "Process scheduling in an OS decides which process runs next on the CPU based on a chosen algorithm.",
      expected: "Operating Systems"
    },
    {
      summary: "Paging divides memory into fixed-size pages and maps them between physical RAM and disk storage.",
      expected: "Operating Systems"
    },
    {
      summary: "The file system organizes data into files and directories, managing how information is stored on disks.",
      expected: "Operating Systems"
    },
    {
      summary: "Device drivers serve as translators between the operating system kernel and hardware peripherals.",
      expected: "Operating Systems"
    },
    {
      summary: "Interrupt handling allows the OS to respond immediately to events like I/O completion or hardware signals.",
      expected: "Operating Systems"
    },
    {
      summary: "Mutexes and semaphores are synchronization primitives that prevent race conditions in concurrent code.",
      expected: "Operating Systems"
    },

    // Data Structures (8 samples)
    {
      summary: "A stack is a LIFO data structure supporting push and pop operations at one end of the collection.",
      expected: "Data Structures"
    },
    {
      summary: "A queue is a FIFO structure where elements are enqueued at the back and dequeued from the front.",
      expected: "Data Structures"
    },
    {
      summary: "A linked list is a sequence of nodes where each node stores data and a pointer to the next node.",
      expected: "Data Structures"
    },
    {
      summary: "A binary tree is a hierarchical data structure where each node has up to two children for fast search.",
      expected: "Data Structures"
    },
    {
      summary: "A hash table uses a hash function to map keys to buckets, allowing average-case constant-time lookup.",
      expected: "Data Structures"
    },
    {
      summary: "A graph consists of vertices connected by edges, modeling relationships between data entities.",
      expected: "Data Structures"
    },
    {
      summary: "A heap is a priority queue implemented as a binary tree that satisfies the heap property for insertions.",
      expected: "Data Structures"
    },
    {
      summary: "An adjacency matrix is a 2D array representing whether pairs of vertices in a graph are connected.",
      expected: "Data Structures"
    },

    // Algorithms (8 samples)
    {
      summary: "Binary search finds an element in a sorted array by repeatedly halving the search interval.",
      expected: "Algorithms"
    },
    {
      summary: "Quick sort is a divide-and-conquer algorithm that partitions around a pivot and recursively sorts.",
      expected: "Algorithms"
    },
    {
      summary: "Merge sort splits the list into halves, sorts each recursively, and merges the sorted lists.",
      expected: "Algorithms"
    },
    {
      summary: "Dijkstra's algorithm computes the shortest paths from a source node to all other nodes in a weighted graph.",
      expected: "Algorithms"
    },
    {
      summary: "Breadth-first search (BFS) explores all nodes at the current depth before moving to the next level.",
      expected: "Algorithms"
    },
    {
      summary: "Depth-first search (DFS) explores as far along each branch as possible before backtracking.",
      expected: "Algorithms"
    },
    {
      summary: "Dynamic programming optimizes recursive solutions by storing and reusing results of overlapping subproblems.",
      expected: "Algorithms"
    },
    {
      summary: "Greedy algorithms make the locally optimal choice at each step in hopes of finding a global optimum.",
      expected: "Algorithms"
    }
  ];

  module.exports = {SAMPLE_TESTS};