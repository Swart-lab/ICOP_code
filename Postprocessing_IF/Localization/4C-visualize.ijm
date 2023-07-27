//this script is for 4 channel images (z-planes are not taken into account)
//in a pipeline: this script > TIFgenerator > CropScaleArrow > SavingStackSlices
//it makes contrast visible. No saving. No closing.
//open the images form .lif file in fiji

//select open images one by one and auto adjust contrast for all channels
for (i=0;i<nImages;i++) {
        selectImage(i+1);
        //just as a checkpoint
        title = getTitle;
        print(title);
        //go through all 4 channels and "auto adjust" contrast
        for (j=1; j<5; j++){
        	Stack.setChannel(j);
        	run("Enhance Contrast", "saturated=0.35");
        }  
        // changes color of channel2 (GFP) from green to yellow (better for the eye)
        Stack.setChannel(1); 
        run("Red");
        Stack.setChannel(2); 
        run("Yellow");
        Stack.setChannel(4); 
        run("Cyan");
}
