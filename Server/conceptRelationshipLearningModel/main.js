const axios = require("axios");
const tf = require("./preProcessor");

async function searchWikipedia(term) {
  const response = await axios.get("https://en.wikipedia.org/w/api.php", {
    params: {
      action: "query",
      format: "json",
      list: "search",
      srsearch: term,
    },
  });
  return response.data.query.search;
}

async function getPageContent(title) {
  const response = await axios.get("https://en.wikipedia.org/w/api.php", {
    params: {
      action: "query",
      format: "json",
      prop: "extracts",
      titles: title,
      explaintext: true,
      redirects: true,
      exsectionformat: "plain",
    },
  });
  const pages = response.data.query.pages;
  return pages[Object.keys(pages)[0]].extract;
}

async function searchWikiAndGetPage(concept) {
  const searchResults = await searchWikipedia(concept);
  const pageContent = await getPageContent(searchResults[0].title);
  return pageContent;
}

function CheckIntersection(tfMap1, tfMap2) {
  const tokens1 = new Set(tfMap1.keys());

  let matchCount = 0;
  for (const token of tfMap2.keys()) {
    if (tokens1.has(token)) {
      matchCount++;
    }
  }

  const totalTokens2 = tfMap2.size;
  if (totalTokens2 === 0) return 0;

  return (matchCount / totalTokens2) * 100;
}

async function main() {
  const concept1 = "client server";

  const concept2 = "peer to peer";

  const concept1Wiki = await searchWikiAndGetPage(concept1);
  const concept1TermFrequency = tf(concept1Wiki);

  const concept2Wiki = await searchWikiAndGetPage(concept2);
  const concept2TermFrequency = tf(concept2Wiki);

  console.log(CheckIntersection(concept1TermFrequency, concept2TermFrequency));
  console.log(CheckIntersection(concept2TermFrequency, concept1TermFrequency));
}

main();
