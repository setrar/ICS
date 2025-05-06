import azure.functions as func
import math
import time
import logging

def numerical_integration_abs_sin(lower, upper, N):
    """
    Perform numerical integration of |sin(x)| using the rectangle method.

    Parameters:
        lower (float): Lower bound of the interval.
        upper (float): Upper bound of the interval.
        N (int): Number of subintervals.

    Returns:
        float: Numerical approximation of the integral.
    """
    dx = (upper - lower) / N
    total_area = 0
    for i in range(N):
        x_mid = lower + (i + 0.5) * dx
        total_area += abs(math.sin(x_mid)) * dx
    return total_area

def format_results(lower, upper, subintervals):
    results = []
    for N in subintervals:
        start_time = time.time()
        result = numerical_integration_abs_sin(lower, upper, N)
        elapsed_time = time.time() - start_time
        results.append(f"N = {N:7d}, Result = {result:.10f}, Time = {elapsed_time:.6f} seconds")
    response = f"Numerical integration of |sin(x)| from {lower} to {upper}:\n\n"
    response += "\n".join(results)
    return response

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info("Numerical Integration Azure Function triggered.")

    try:
        # Extract route parameters
        lower = req.route_params.get("lower")
        upper = req.route_params.get("upper")

        # Convert bounds to floats
        if lower is None or upper is None:
            return func.HttpResponse(
                "Missing required route parameters: 'lower' and 'upper'.",
                status_code=400,
            )

        lower = float(lower)
        upper = float(upper)

        if lower >= upper:
            return func.HttpResponse("Error: Lower bound must be less than upper bound.", status_code=400)

        # Perform numerical integration
        subintervals = [10, 100, 1000, 10000, 100000, 1000000, 10000000]  # 7 values for N
        response_text = format_results(lower, upper, subintervals)

        # Return response as plain text
        return func.HttpResponse(response_text, mimetype="text/plain")

    except ValueError as e:
        return func.HttpResponse(f"Error: Bounds must be valid numbers: {str(e)}", status_code=400)
