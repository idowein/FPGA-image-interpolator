import numpy as np
import matplotlib.pyplot as plt

# Configuration
# input_txt_file = "text_io/yelement102_dirt.txt"   # Replace with your path if needed
# input_txt_file = "text_io/image.txt"   # Replace with your path if needed
# input_txt_file = "text_io/texts_n_pics/ford_truck_640x480.txt"   # Replace with your path if needed
input_txt_file = "text_io/texts_n_pics/median_out_nir.txt"   # Replace with your path if needed
output_png_file = "text_io/texts_n_pics/output_image.png"
width, height = 640, 480

# Load numbers from the file
data = np.loadtxt(input_txt_file, dtype=int)

# If data is 1D, reshape it
if data.ndim == 1:
    total_pixels = width * height
    data = data[:total_pixels]  # Truncate if needed
    data = np.pad(data, (0, max(0, total_pixels - len(data))), mode='constant')
    data = data.reshape((height, width))

# Normalize to 0–255
normalized = np.clip((data - np.min(data)) / (np.max(data) - np.min(data)) * 255, 0, 255).astype(np.uint8)

# Save as PNG
plt.imsave(output_png_file, normalized, cmap='gray')

print(f"Image saved as {output_png_file}")
