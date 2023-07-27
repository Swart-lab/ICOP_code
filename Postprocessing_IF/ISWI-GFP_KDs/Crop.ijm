//this script should be used on stacks
//in a pipeline: visualize > TIFgenerateor > this script > SavingStackSlices
//this script mainly automaizes saving the checkpoitns as .tiff files

//get the path and the title of the current image
path = getDir("image"); 
imageTitle = getTitle();


//you need to crop the stack
makeRectangle(96, 139, 309, 206);
run("Specify...", "width=70 height=70 x=5.77 y=8.36 slice=1 scaled");
waitForUser("Place where to crop, then hit OK");
run("Crop");
saveAs("Tiff", path+File.separator+"crop-"+imageTitle);
