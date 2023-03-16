from flask import Flask

app = Flask(__name__)

# @app.route("/")
# def index():
#     celsius = request.args.get("celsius", "")
#     return (
#         """<form action="" method="get">
#                 <input type="text" name="celsius">
#                 <input type="submit" value="Convert">
#             </form>"""
#         + celsius)
    # fahrenheit = request.args.get("fahrenheit", "")
    # return (
    #     """<form action="" method="get">
    #             <input type="text" name="fahrenheit">
    #             <input type="submit" value="Convert">
    #         </form>"""
    #     + fahrenheit
    # )
    
    

@app.route("/c2f/<celsius>")
def fahrenheit_from(celsius):
    """Convert Celsius to Fahrenheit degrees."""
    try:
        fahrenheit = float(celsius) * 9 / 5 + 32
        fahrenheit = round(fahrenheit, 3)  # Round to three decimal places
        return str(fahrenheit)
    except ValueError:
        return "invalid input"

@app.route("/f2c/<fahrenheit>")
def celsius_from(fahrenheit):
    """Convert Fahrenheit to Celsius Degrees."""
    try:
        celsius_transit = float(fahrenheit) - 32 
        celsius = float(celsius_transit) * 5/9
        celsius = round(celsius, 3)  # Round to three decimal places
        return str(celsius)
    except ValueError:
        return "invalid input"

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=3999, debug=True)

