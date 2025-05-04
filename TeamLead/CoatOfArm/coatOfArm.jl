using Luxor

# Load the image using Luxor's readpng function
img_path = "./images/Canva-3rdChoice.png"  # Replace with your image path
img = readpng(img_path)

# Define the output path
output_path = "./images/Canva-3rdChoice_with_text.png"

# Create a drawing surface and set it as the current drawing
drawing = Drawing(800, 800, output_path)
origin()

# Place the image
placeimage(img, 0, 0, centered = true)  # Display the image in the center

# Draw the banner rectangle behind the text
banner_width = 400
banner_height = 60
banner_position = Point(0, -350)
sethue("white")
box(banner_position, banner_width, banner_height, :fill)  # Adjust color and dimensions as needed

# Draw the text on top of the banner
fontsize(40)
sethue("black")
text("Somewhat Diverse", banner_position; halign = :center, valign = :middle)

# Finish the drawing and save it
finish()
println("Image saved at: $output_path")
