from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

REQUEST_COUNT = Counter('app_requests_total', 'Total number of requests to the application')

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}

@app.route('/some_endpoint')
def index():
    REQUEST_COUNT.inc()
    return "Hello, World!"

