const students = [
  [
    1,
    "Alice Johnson",
    "Massachusetts Institute of Technology",
    "Computer Science",
    "77 Massachusetts Ave, Cambridge, MA",
    21,
  ],
  [
    2,
    "Bob Smith",
    "Stanford University",
    "Electrical Engineering",
    "450 Serra Mall, Stanford, CA",
    22,
  ],
  [
    3,
    "Carol Martinez",
    "Harvard University",
    "Economics",
    "1350 Massachusetts Ave, Cambridge, MA",
    20,
  ],
  [
    4,
    "David Lee",
    "California Institute of Technology",
    "Mechanical Engineering",
    "1200 E California Blvd, Pasadena, CA",
    23,
  ],
  [
    5,
    "Emma Davis",
    "Princeton University",
    "Mathematics",
    "Princeton, NJ 08544",
    21,
  ],
  [
    6,
    "Frank Brown",
    "University of California, Berkeley",
    "Physics",
    "200 California Hall, Berkeley, CA",
    22,
  ],
  [
    7,
    "Grace Wilson",
    "University of Oxford",
    "Philosophy",
    "Oxford OX1 2JD, UK",
    24,
  ],
  [8, "Henry Miller", "Yale University", "History", "New Haven, CT 06520", 21],
  [
    9,
    "Ivy Clark",
    "Columbia University",
    "Journalism",
    "116th St & Broadway, New York, NY",
    22,
  ],
  [
    10,
    "Jackie Taylor",
    "University of Cambridge",
    "Engineering",
    "The Old Schools, Trinity Ln, Cambridge CB2 1TN, UK",
    23,
  ],
];

const flashCardPerformance = [
  [1, 1, 0.85, "CS 101", 1],
  [2, 1, 0.8, "CS 101", 2],
  [3, 1, 0.75, "CS 101", 3],
  [4, 1, 0.9, "CS 101", 4],
  [5, 1, 0.7, "CS 101", 5],
  [6, 1, 0.65, "CS 101", 6],
  [7, 1, 0.8, "CS 101", 7],
  [8, 1, 0.88, "CS 101", 8],
  [9, 1, 0.92, "CS 101", 9],
  [10, 1, 0.78, "CS 101", 10],
];

const csFlashCardData = [
  [
    1,
    "Introduction to Programming",
    "An overview of programming fundamentals including syntax, semantics, and basic constructs.",
    "CS 101",
  ],
  [
    2,
    "Variables and Data Types",
    "Detailed explanation of various data types, variable declaration, and initialization.",
    "CS 101",
  ],
  [
    3,
    "Control Structures",
    "Covers conditionals, loops, and branching statements in programming languages.",
    "CS 101",
  ],
  [
    4,
    "Functions and Modular Programming",
    "Introduction to functions, scope, and the benefits of modular design.",
    "CS 101",
  ],
  [
    5,
    "Arrays and Lists",
    "Understanding the use and implementation of arrays and lists for data storage.",
    "CS 101",
  ],
  [
    6,
    "Recursion",
    "Explains the concept of recursion, base cases, and recursive function design.",
    "CS 101",
  ],
  [
    7,
    "Big O Notation",
    "An overview of algorithm complexity and performance analysis using Big O notation.",
    "CS 101",
  ],
  [
    8,
    "Object-Oriented Programming",
    "Discusses classes, objects, encapsulation, inheritance, and polymorphism.",
    "CS 101",
  ],
  [
    9,
    "Debugging Techniques",
    "Introduction to debugging strategies and tools for error detection and resolution.",
    "CS 101",
  ],
  [
    10,
    "Software Development Lifecycle",
    "Covers the stages of software development from planning to deployment.",
    "CS 101",
  ],
];

const tasksData = [
  [1, "Read chapter 1 of the textbook", 1, "2025-04-20"],
  [2, "Complete assignment on React", 1, "2025-04-21"],
  [3, "Practice JavaScript coding problems", 1, "2025-04-22"],
  [4, "Attend study group meeting", 1, "2025-04-23"],
  [5, "Review lecture notes", 1, "2025-04-24"],
];

module.exports = {
  csFlashCardData,
  flashCardPerformance,
  students,
  tasksData,
};
