# test_lsp.py
from _typeshed import ProfileFunction
import math

def greet(name: str) -> str:
    message = f"Hello, {name}!"
    return message

def calculate_circle_area(radius: float) -> float:
    if radius < 0:
        raise ValueError("Radius cannot be negative")
    return math.pi * radius ** 2

if __name__ == "__main__":
    user_name = "Neovim"
    print(greet(user_name))

    r = 5
    print(f"Area of circle with radius {r}: {calculate_circle_area(r)}")
