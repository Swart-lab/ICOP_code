// get the path and the title of the current image
path = getDir("image");
imageTitle = getTitle();

//run scale bar
run("Scale Bar...", "width=10 height=15 thickness=15 font=50 color=Yellow background=None location=[Lower Right] horizontal bold");
run("Flatten");
saveAs("Tiff", path+File.separator+"Auto-scale-"+imageTitle);

selectWindow(imageTitle);
close();


