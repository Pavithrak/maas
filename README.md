# README

Mocking as a Service

<b>Create a new mock server</b>

POST http://localhost:3000/mock_servers.json
BODY {"mock_server": {"name": "my-serv"}}

RESPONSE: {
    "id": 3,
    "created_at": "2018-03-11T08:50:21.646Z",
    "updated_at": "2018-03-11T08:50:21.646Z",
    "url": "http://localhost:3000/mock_servers/3.json"
}

<b>Mock an endpoint in your mocking server</b>

POST http://localhost:3000/mock_servers/3/mocks/when.json
BODY {"mock": {"url": "/some/someother_id/some_attr", "method": "GET", "result": "{\"name\": \"sample name\"}"}}
RESPONSE: {
    "message": "mock saved successfully"
}

<b>Access mocked endpoint</b>

GET http://localhost:3000/mock_servers/3/mocks/some/someother_id/some_attr.json
Response 
{
    "name": "sample name"
}

<b>Mock an endpoint with query params</b>

POST http://localhost:3000/mock_servers/3/mocks/when.json
BODY {"mock": {"url": "/some/someother_id/some_attr", "method": "GET", "query": "{\"q1\": \"val q1\", \"q2\": \"val q2\"}", "result": "{\"name\": \"samp name 1\"}"}}
RESPONSE: {
    "message": "mock saved successfully"
}

<b>Access mocked endpoint with query params</b>

<b>GET</b><br/> 
http://localhost:3000/mock_servers/3/mocks/someother/someother_id/some_attr.json?q2=val q2&q1=val q1
<br/>
<b>RESPONSE:</b> 
{
    "name": "samp name 1"
}


<b>Mock POST endpoint with body</b>
POST http://localhost:3000/mock_servers/3/mocks/when.json
BODY {"mock": {"url": "/someother/someother_id", "method": "POST", "query": "{\"q1\": \"val q1\", \"q2\": \"val q2\"}", "result": "{\"name\": \"samp name post\"}", "body": "{\"attr1\": \"value 1\"}"}}
RESPONSE {
             "message": "mock saved successfully"
         }



POST
http://localhost:3000/mock_servers/3/mocks/someother/someother_id?q1=val q1&q2=val q2
BODY {"attr1": "value 1"}
RESULT {
           "name": "samp name post"
       }