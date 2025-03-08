from fastapi import FastAPI, WebSocket
import asyncio
from fastapi.middleware.cors import CORSMiddleware  # Add this import

from pydantic_model.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_sorce_service import SortSorceService
from services.llm_service import LLMService

app = FastAPI()

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

search_service = SearchService()
sort_sorce_service = SortSorceService()
llm_service = LLMService()

@app.websocket("/ws/chats")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    
    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        print(data)
        query = data.get("query")

        search_result =  search_service.web_search(query)
        sorted_result = sort_sorce_service.sort_source(query, search_result)
        
        await asyncio.sleep(0.1)
        await websocket.send_json({
            'type': 'search_result',
            'data': sorted_result
        })
        
        
        for chunk in llm_service.generate_response(query, sorted_result):
            await asyncio.sleep(0.1)
            await websocket.send_json({'type':'content', 'data': chunk})
        
        print('result send')

    except :
        print("error occured")
    
    finally:
        pass


@app.post("/chats")
def chat_endpoint(body: ChatBody):
    search_result =  search_service.web_search(body.query)
    #sort the sorce
    sorted_result = sort_sorce_service.sort_source(body.query, search_result)
    #generate the response
    response = llm_service.generate_response(body.query, sorted_result)
    
    return response