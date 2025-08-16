const axios = require("axios");
const cheerio = require("cheerio");

async function scrapeWikipediaTopic(topic) {
  const searchUrl = "https://en.wikipedia.org/w/api.php";
  const searchParams = {
    action: "query",
    list: "search",
    srsearch: topic,
    format: "json",
    origin: "*",
  };

  let searchResponse;
  try {
    searchResponse = await axios.get(searchUrl, { params: searchParams });
  } catch (error) {
    throw new Error(`Wikipedia search failed: ${error.message}`);
  }

  const results = searchResponse.data.query.search;
  if (!results || results.length === 0) {
    return { topic, links: [] };
  }

  const pageTitle = results[0].title;
  const pageUrl =
    "https://en.wikipedia.org/wiki/" + encodeURIComponent(pageTitle);

  let pageResponse;
  try {
    pageResponse = await axios.get(pageUrl);
  } catch (error) {
    return { topic, links: [] };
  }

  const $ = cheerio.load(pageResponse.data);
  const container = $("#mw-content-text .mw-parser-output");

  const links = [];
  container.find("p a, ul a, ol a").each((_, element) => {
    const href = $(element).attr("href");
    const text = $(element).text().trim();

    if (href && href.startsWith("/wiki/") && !href.includes(":") && text) {
      links.push(text);
    }
  });

  return { topic, links };
}

module.exports = scrapeWikipediaTopic;
