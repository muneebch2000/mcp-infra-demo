export default {
  async fetch(request, env) {
    const url = new URL(request.url);

   
    if (url.pathname === "/health") {
      return new Response(JSON.stringify({ status: "ok", service: "mcp-server" }), {
        headers: { "Content-Type": "application/json" },
      });
    }

    
    if (url.pathname === "/tools" && request.method === "GET") {
      return new Response(JSON.stringify({
        tools: [
          {
            name: "get_weather",
            description: "Get current weather for a city",
            parameters: {
              type: "object",
              properties: {
                city: { type: "string", description: "City name" }
              },
              required: ["city"]
            }
          }
        ]
      }), {
        headers: { "Content-Type": "application/json" },
      });
    }

    
    if (url.pathname === "/call" && request.method === "POST") {
      const body = await request.json();
      if (body.tool === "get_weather") {
        return new Response(JSON.stringify({
          result: `Weather in ${body.parameters.city}: 22°C, sunny.`
        }), {
          headers: { "Content-Type": "application/json" },
        });
      }
    }

    return new Response("MCP Server Running", { status: 200 });
  }
};