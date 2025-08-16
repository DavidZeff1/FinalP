require("dotenv").config({
  path: require("path").resolve(__dirname, "./.env"),
});

const {
  initializeClassifier,
  classifyFlashCard,
} = require("../Server/conceptRelationshipLearningModel/model");

(async () => {
  try {
    console.log("Initializing classifier…");
    await initializeClassifier();
    console.log("✅ Classifier ready\n");

    const samples = [
      {
        expected: "operating systems",
        concept: "Process scheduling",
        summary:
          "The OS uses round-robin or priority-based algorithms to decide which process runs next.",
      },
      {
        expected: "algorithms",
        concept: "Dijkstra’s shortest path",
        summary:
          "An algorithm that computes the minimum distance from a source node to all other nodes in a weighted graph.",
      },
      {
        expected: "cell biology",
        concept: "Mitochondrial function",
        summary:
          "The mitochondrion generates ATP through oxidative phosphorylation in eukaryotic cells.",
      },
      {
        expected: "cs 101",
        concept: "Variables and data types",
        summary:
          "Introduction to integer, float, string, and boolean types and how to declare variables in a programming language.",
      },
      {
        expected: "computer networks",
        concept: "TCP handshake",
        summary:
          "Transmission Control Protocol uses a three-way handshake (SYN, SYN-ACK, ACK) to establish a connection between client and server.",
      },
      {
        expected: "databases",
        concept: "SQL JOIN",
        summary:
          "Combining rows from two or more tables based on a related column using INNER JOIN, LEFT JOIN, etc.",
      },
      {
        expected: "machine learning",
        concept: "Gradient descent",
        summary:
          "An optimization algorithm that adjusts model parameters in the direction of the negative gradient of the loss function.",
      },
      {
        expected: "data structures",
        concept: "Binary search tree insertion",
        summary:
          "Inserting a node in a BST by comparing the key and traversing left or right until the correct null child is found.",
      },
    ];

    for (const sample of samples) {
      const pred = classifyFlashCard({
        concept: sample.concept,
        summary: sample.summary,
      });
      console.log(`• [expected: ${sample.expected}] → predicted: ${pred}`);
    }

    process.exit(0);
  } catch (err) {
    console.error("Error testing classifier:", err);
    process.exit(1);
  }
})();
