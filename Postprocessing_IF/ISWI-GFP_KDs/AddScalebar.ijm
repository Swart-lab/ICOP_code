//this script is to add scale bar in the overlay and flatten into RGB
//Adjust brightness and contrast for each channel as you want them
//operations done: add scale bar, flatten overlay, save as tiff
//this script works on currently selected image

// get the path and the title of the current image
path = getDir("image");
imageTitle = getTitle();

//run scale bar
run("Scale Bar...", "width=10 height=15 thickness=15 font=50 color=Yellow background=None location=[Lower Right] horizontal bold");
run("Flatten");
saveAs("Tiff", path+File.separator+"Auto-scale-"+imageTitle);

selectWindow(imageTitle);
close();


