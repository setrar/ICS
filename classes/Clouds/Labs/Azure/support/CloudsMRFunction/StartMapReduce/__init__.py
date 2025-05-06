
import azure.durable_functions as df
import azure.functions as func

async def main(req: func.HttpRequest, starter: str) -> func.HttpResponse:
    client = df.DurableOrchestrationClient(starter)
    instance_id = await client.start_new("MasterOrchestrator", None, None)
    return client.create_check_status_response(req, instance_id)
