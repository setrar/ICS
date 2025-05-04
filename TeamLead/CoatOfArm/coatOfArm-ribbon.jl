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

# Draw a decorative banner for the text
banner_center = Point(0, -350)
banner_width = 400
banner_height = 60
sethue("white")

# Draw the main body of the banner
move(banner_center - Point(banner_width / 2, 0))
line(banner_center + Point(banner_width / 2, 0))
line(banner_center + Point(banner_width / 2, -banner_height))
line(banner_center - Point(banner_width / 2, -banner_height))
closepath()
fillpath()  # Corrected to fill the path

# Draw the ribbon ends
ribbon_end_width = 40
move(banner_center - Point(banner_width / 2, 0))
line(banner_center - Point(banner_width / 2 + ribbon_end_width, -banner_height / 2))
line(banner_center - Point(banner_width / 2, -banner_height))
closepath()
fillpath()  # Corrected to fill the path

move(banner_center + Point(banner_width / 2, 0))
line(banner_center + Point(banner_width / 2 + ribbon_end_width, -banner_height / 2))
line(banner_center + Point(banner_width / 2, -banner_height))
closepath()
fillpath()  # Corrected to fill the path

# Draw the text on top of the banner
fontsize(40)
sethue("black")
text("Somewhat Diverse", banner_center; halign = :center, valign = :middle)

# Finish the drawing and save it
finish()
println("Image saved at: $output_path")
