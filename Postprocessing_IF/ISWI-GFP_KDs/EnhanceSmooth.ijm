//get the path and the title of the current image
path = getDir("image"); 
imageTitle = getTitle();

//adjust Brightness/contrast
Stack.setChannel(1);
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(2);
run("Enhance Contrast", "saturated=0.35");
run("Smooth", "stack");
saveAs("Tiff", path+File.separator+"AutoSmooth-"+imageTitle)
