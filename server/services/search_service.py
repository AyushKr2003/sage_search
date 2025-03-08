from tavily import TavilyClient
import trafilatura
from config import Settings

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)
response = tavily_client.search("Who is Leo Messi?")

class SearchService:
    def web_search(self, query:str):
        results = []
        response = tavily_client.search(query, max_results=10)
        search_result = response.get("results", [])

        for result in search_result:
            url = result.get("url")
            downloaded = trafilatura.fetch_url(url)
            content = trafilatura.extract(downloaded, include_comments=False)

            results.append({
                "title": result.get("title", ""),
                "url": url,
                "content": content
            })
        
        return results