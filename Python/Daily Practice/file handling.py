 #file handling

with open("example.txt", "w") as file:
    file.write("Hello, this is a sample text.\n")
    file.write("Python file handling example.\n")


with open("example.txt", "r") as file:
    content = file.read()
    print(content)