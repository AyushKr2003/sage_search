from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np

class SortSorceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer('all-MiniLM-L6-v2')

    def sort_source(self, query: str, search_result: List[dict]):
        try:
            relevant_docs = []
            querry_embedding = self.embedding_model.encode(query)
            
            for res in search_result:
                # Check if res is not None and has a content field with non-None value
                if res is None or "content" not in res or res["content"] is None:
                    continue
                    
                # Make sure content is a string
                content = str(res["content"])
                if not content.strip():  # Skip empty content
                    continue
                    
                res_embedding = self.embedding_model.encode(content)
                
                similarity = float(np.dot(querry_embedding, res_embedding) / (np.linalg.norm(querry_embedding) * np.linalg.norm(res_embedding)))
                res["similarity"] = similarity

                if similarity > 0.3:
                    relevant_docs.append(res)
                
            return sorted(relevant_docs, key=lambda x: x["similarity"], reverse=True)
        
        except Exception as e:
            print(f"Error in sort_source: {e}")
            